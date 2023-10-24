def print_options
  puts 'Options:'
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

def main
  loop do
    puts 'Welcome to the Cataloge of my things'
    print_options
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      puts 'List of Books:'
    when 2
      puts 'List of music albums:'
    when 3
      puts 'List of games:'
    when 4
      puts 'List of genres:'
    when 5
      puts 'List of Labels:'
    when 6
      puts 'List of authors:'
    when 7
      puts 'Add a book:'
    when 8
      puts 'Add a music album:'
    when 9
      puts 'Add a game:'
    when 10
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

main
