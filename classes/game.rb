class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author

  def initialize(title, publish_date, multiplayer, last_played_at, author)
    super(id, title, publish_date)
    @id = Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  def can_be_archived?
    super && (Date.today - @last_played_at.to_date).to_i > 730
  end
end
