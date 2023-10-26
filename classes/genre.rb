class Genre
  attr_reader :id, :name
  attr_accessor :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*_args)
    {
      'class_name' => 'Genre',
      'id' => id,
      'name' => name
    }
  end

  def self.from_json(data)
    Genre.new(data['id'], data['name'])
  end
end
