require './classes/item'
require './classes/genre'
require './classes/music_album'

items = []

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
    puts 'List of Books:'
  when 2
    puts 'List of all music albums:'
    list_items(MusicAlbum, items).each { |music_album| puts "Album ID: #{music_album.id}, Title: #{music_album.title}" }
  when 3
    puts 'List of games:'
  when 4
    list_genres(items)
  when 5
    puts 'List of Labels:'
  when 6
    puts 'List of authors:'
  when 7
    puts 'Add a book:'
  when 8
    add_music_album(items)
  when 9
    puts 'Add a game:'
  when 10
    puts 'Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
