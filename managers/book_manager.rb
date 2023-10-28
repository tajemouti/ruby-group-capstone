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

def list_books(items)
  puts 'List of all books:'
  books = list_items(Book, items)
  books.each { |book| puts "Book ID: #{book.id}, Title: #{book.title}" }
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

def list_labels(items)
  puts 'List of Labels:'
  labels = list_items(Label, items)
  labels.each { |label| puts "Label ID: #{label.id}, Title: #{label.title}, Color: #{label.color}" }
end
