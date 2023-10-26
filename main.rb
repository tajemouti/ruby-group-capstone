# main.rb
require 'json'
require 'date'
require './classes/item'
require './classes/genre'
require './classes/music_album'
require './classes/book'
require './classes/label'
require './classes/author'
require './classes/game'

items = []
def save_items_to_json(items)
  File.open('items.json', 'w') do |file|
    serialized_items = items.map(&:to_json)
    file.puts serialized_items.to_json
  end
end

def load_items_from_json
  if File.exist?('items.json')
    json_data = JSON.parse(File.read('items.json'))
    json_data.map do |item_data|
      # Determine the class name and call the appropriate from_json method.
      class_name = item_data['class_name']
      case class_name
      when 'Book'
        Book.from_json(item_data)
      when 'Label'
        Label.from_json(item_data)
      # Add other class cases if needed
      else
        nil
      end
    end.compact
  else
    []
  end
end

items = load_items_from_json

def list_genres(items)
  puts 'List of all genres:'
  genres = items.select { |item| item.is_a?(MusicAlbum) }.map(&:genre)
  genres.each { |genre| puts "Genre ID: #{genre.id}, Name: #{genre.name}" }
end

def list_items(class_name, items)
  items.select { |item| item.is_a?(class_name) }
end

def add_item(item, items)
  items << item
  puts "#{item.class.name} added successfully."
end

def add_music_album(items)
  puts 'Enter Album Title:'
  title = gets.chomp
  puts 'Is it on Spotify? (true/false):'
  on_spotify = gets.chomp == 'true'
  puts 'Enter Genre Name:'
  genre_name = gets.chomp
  genre = Genre.new(items.size + 1, genre_name)
  new_album = MusicAlbum.new(items.size + 1, title, Time.now, on_spotify, genre)
  add_item(new_album, items)
end

def list_labels(items)
  puts 'List of Labels:'
  labels = list_items(Label, items)
  labels.each { |label| puts "Label ID: #{label.id}, Title: #{label.title}, Color: #{label.color}" }
end

def add_book(items)
  puts 'Enter Book Title:'
  title = gets.chomp
  puts 'Enter Publisher:'
  publisher = gets.chomp
  puts 'Enter Publish Date (YYYY-MM-DD):'
  publish_date = gets.chomp
  puts 'Enter Cover State (good/bad):'
  cover_state = gets.chomp

  new_book = Book.new(items.size + 1, title, Date.parse(publish_date), publisher, cover_state)

  puts 'Do you want to add a Label for this book? (yes/no):'
  add_label = gets.chomp == 'yes'

  if add_label
    label = add_label_for_item(items)
    new_book.add_label(label)
  end

  add_item(new_book, items)
end

def add_label_for_item(items)
  puts 'Enter Label Title:'
  label_title = gets.chomp
  puts 'Enter Label Color:'
  label_color = gets.chomp
  label = Label.new(items.size + 1, label_title, label_color)
  add_item(label, items)
  label
end

def list_books(items)
  puts 'List of all books:'
  books = list_items(Book, items)
  books.each { |book| puts "Book ID: #{book.id}, Title: #{book.title}" }
end

def list_music_albums(items)
  puts 'List of all music albums:'
  music_albums = list_items(MusicAlbum, items)
  music_albums.each { |music_album| puts "Album ID: #{music_album.id}, Title: #{music_album.title}" }
end

def list_authors(items)
  puts 'List of all authors:'
  authors = items.select { |item| item.is_a?(Game) }.map(&:author)
  puts 'Author list is empty, please add a game first.' if authors.empty?
  authors.each do |author|
    puts "Author ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
  end
end

def list_games(items)
  puts 'List of all games:'
  games = list_items(Game, items)
  puts 'List of games is empty, please add a new game.' if games.empty?
  games.each_with_index { |game, index| puts "Game ID: #{index + 1}, Title: #{game.title}" }
end

def add_game(items)
  puts 'Enter Game Title:'
  title = gets.chomp

  puts 'Is it Multiplayer? (true/false):'
  multiplayer = gets.chomp == 'true'

  puts 'Enter the Publish Date (YYYY-MM-DD):'
  publish_date = Date.parse(gets.chomp)

  puts 'Enter the Last Played Date (YYYY-MM-DD):'
  last_played_at = Date.parse(gets.chomp)

  puts 'Enter the Author First Name:'
  first_name = gets.chomp

  puts 'Enter the Author Last Name:'
  last_name = gets.chomp

  author = Author.new(items.size + 1, first_name, last_name)
  new_game = Game.new(title, publish_date, multiplayer, last_played_at, author)

  add_item(new_game, items)
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
