# label.rb

class Label
  attr_reader :id, :title, :color
  attr_accessor :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def to_json(*_args)
    {
      'class_name' => 'Label',
      'id' => id,
      'title' => title,
      'color' => color
    }
  end

  def self.from_json(data)
    Label.new(data['id'], data['title'], data['color'])
  end
end
