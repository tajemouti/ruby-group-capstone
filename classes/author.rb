class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*_args)
    {
      'class_name' => 'Author',
      'id' => id,
      'first_name' => first_name,
      'last_name' => last_name
    }
  end

  def self.from_json(data)
    Author.new(data['id'], data['first_name'], data['last_name'])
  end
end
