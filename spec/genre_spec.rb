require './classes/genre'

describe Genre do
  it 'is initialized with an ID and name' do
    genre = Genre.new(1, 'Rock')
    expect(genre.id).to eq(1)
    expect(genre.name).to eq('Rock')
  end

  it 'can add an item' do
    genre = Genre.new(1, 'Rock')
    music_album = MusicAlbum.new(1, 'Album 1', Date.today, true)
    genre.add_item(music_album)
    expect(genre.items).to include(music_album)
  end

  it 'returns a JSON representation of the genre' do
    genre = Genre.new(1, 'Rock')
    expected_json = {
      'class_name' => 'Genre',
      'id' => 1,
      'name' => 'Rock'
    }
    expect(genre.to_json).to eq(expected_json)
  end

  it 'creates a Genre object from JSON data' do
    data = {
      'class_name' => 'Genre',
      'id' => 1,
      'name' => 'Rock'
    }
    genre = Genre.from_json(data)
    expect(genre).to be_an_instance_of(Genre)
    expect(genre.id).to eq(1)
    expect(genre.name).to eq('Rock')
  end
end
