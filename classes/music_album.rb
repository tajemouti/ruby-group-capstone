class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(id, title, publish_date, on_spotify)
    super(id, title, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
end
