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
end
