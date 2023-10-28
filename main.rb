require 'json'
require 'date'
require './classes/item'
require './classes/genre'
require './classes/music_album'
require './classes/book'
require './classes/label'
require './classes/author'
require './classes/game'
require './managers/book_manager'
require './managers/music_manager'
require './managers/game_manager'

def save_items_to_json(items)
  serialized_items = items.map(&:to_json)
  write_json_to_file('./data/items.json', serialized_items)
end

def write_json_to_file(file_name, data)
  File.open(file_name, 'w') do |file|
    file.puts data.to_json
  end
end

def load_items_from_json
  return [] if File.empty?('./data/items.json')

  class_mapping = {
    'Book' => Book,
    'Label' => Label,
    'MusicAlbum' => MusicAlbum,
    'Genre' => Genre,
    'Game' => Game,
    'Author' => Author
  }
  json_data = JSON.parse(File.read('./data/items.json'))
  json_data.map do |item_data|
    class_name = item_data['class_name']
    class_mapping[class_name].from_json(item_data)
  end.compact
end

items = load_items_from_json

def list_items(class_name, items)
  items.select { |item| item.is_a?(class_name) }
end

def add_item(item, items)
  items << item
  puts "#{item.class.name} added successfully."
end

puts 'Welcome to the Cataloge of my things'

def print_options
  puts "\nOptions:"
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List of games'
  puts '4. List all genres'
  puts '5. List all labels'
  puts '6. List all authors'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a game'
  puts '10. Quit'
end

loop do
  print_options
  print 'Enter your choice: '
  choice = gets.chomp.to_i
  case choice
  when 1
    list_books(items)
  when 2
    list_music_albums(items)
  when 3
    list_games(items)
  when 4
    list_genres(items)
  when 5
    list_labels(items)
  when 6
    list_authors(items)
  when 7
    add_book(items)
  when 8
    add_music_album(items)
  when 9
    add_game(items)
  when 10
    save_items_to_json(items)
    puts 'Items saved to JSON file.'
    puts 'Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
