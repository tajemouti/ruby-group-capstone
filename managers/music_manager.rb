def add_music_album(items)
  puts 'Enter Album Title:'
  title = gets.chomp

  puts 'Is it on Spotify? (true/false):'
  on_spotify = gets.chomp == 'true'

  puts 'Enter Publish Date (YYYY-MM-DD):'
  publish_date = DateTime.parse(gets.chomp)

  puts 'Enter Genre Name:'
  genre_name = gets.chomp

  genre = Genre.new(items.size + 1, genre_name)
  add_item(genre, items)

  new_album = MusicAlbum.new(items.size + 1, title, publish_date.to_time, on_spotify)
  add_item(new_album, items)
end

def list_music_albums(items)
  puts 'List of all music albums:'
  music_albums = list_items(MusicAlbum, items)
  music_albums.each { |music_album| puts "Album ID: #{music_album.id}, Title: #{music_album.title}" }
end

def list_genres(items)
  puts 'List of all genres:'
  genres = list_items(Genre, items)
  genres.each { |genre| puts "Genre ID: #{genre.id}, Name: #{genre.name}" }
end
