require './classes/music_album'
require 'date'

describe MusicAlbum do
  let(:today) { Date.today }
  let(:on_spotify) { true }
  let(:not_on_spotify) { false }

  it 'can be archived if it is not archived and on Spotify' do
    music_album = MusicAlbum.new(1, 'Album 1', today, on_spotify)
    expect(music_album.can_be_archived?).to be true
  end

  it 'cannot be archived if it is already archived' do
    music_album = MusicAlbum.new(1, 'Album 2', today, on_spotify)
    music_album.move_to_archive
    expect(music_album.can_be_archived?).to be false
  end

  it 'cannot be archived if it is not on Spotify' do
    music_album = MusicAlbum.new(1, 'Album 3', today, not_on_spotify)
    expect(music_album.can_be_archived?).to be false
  end

  it 'returns a JSON representation of the music album' do
    album = MusicAlbum.new(1, 'Album Title', Date.today, true)
    expected_json = {
      'class_name' => 'MusicAlbum',
      'id' => 1,
      'title' => 'Album Title',
      'publish_date' => Date.today,
      'on_spotify' => true
    }
    expect(album.to_json).to eq(expected_json)
  end

  it 'creates a MusicAlbum object from JSON data' do
    data = {
      'class_name' => 'MusicAlbum',
      'id' => 1,
      'title' => 'Album Title',
      'publish_date' => Date.today,
      'on_spotify' => true
    }
    album = MusicAlbum.from_json(data)
    expect(album).to be_an_instance_of(MusicAlbum)
    expect(album.id).to eq(1)
    expect(album.title).to eq('Album Title')
    expect(album.publish_date).to eq(Date.today)
    expect(album.on_spotify).to be true
  end
end
