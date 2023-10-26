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
end
