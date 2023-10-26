# book.rb
require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, title, publish_date, publisher, cover_state)
    super(id, title, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    {
      'class_name' => 'Book',
      'id' => id,
      'title' => title,
      'publish_date' => publish_date.strftime('%Y-%m-%d'),
      'publisher' => publisher,
      'cover_state' => cover_state
    }
  end

  def self.from_json(data)
    Book.new(data['id'], data['title'], Date.parse(data['publish_date']), data['publisher'], data['cover_state'])
  end
end
