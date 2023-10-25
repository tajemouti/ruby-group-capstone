

#main.rb
require 'date'
require './classes/item'
require './classes/genre'
require './classes/music_album'
require './classes/book'
require './classes/label'

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

def list_books(items)
  puts 'List of all books:'
  books = list_items(Book, items)
  books.each { |book| puts "Book ID: #{book.id}, Title: #{book.title}" }
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
    list_items(Book, items).each { |book| puts "Book ID: #{book.id}, Title: #{book.title}" }
  when 2
    puts 'List of all music albums:'
    list_items(MusicAlbum, items).each { |music_album| puts "Album ID: #{music_album.id}, Title: #{music_album.title}" }
  when 3
    puts 'List of games:'
  when 4
    list_genres(items)
  when 5
    puts 'List of Labels:'
    list_labels(items)
  when 6
    puts 'List of authors:'
  when 7
    add_book(items)
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
