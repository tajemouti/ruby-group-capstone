class Item
  attr_accessor :title
  attr_reader :id, :publish_date, :archived

  def initialize(id, title, publish_date)
    @id = id
    @title = title
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    !archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end
end
