class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(id, title, publish_date, on_spotify)
    super(id, title, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    !@archived && @on_spotify
  end

  def to_json(*_args)
    {
      'class_name' => 'MusicAlbum',
      'id' => id,
      'title' => title,
      'publish_date' => publish_date,
      'on_spotify' => on_spotify
    }
  end

  def self.from_json(data)
    MusicAlbum.new(data['id'], data['title'], data['publish_date'], data['on_spotify'])
  end
end
