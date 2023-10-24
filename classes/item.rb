require 'date'  # Require the Date class

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date
  attr_reader :archived

  def initialize(id, genre, author, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return false if @publish_date.nil?

    if (Date.today - @publish_date.to_date).to_i > 3650
      return true
    end
    return false
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
  def label=(label)
    @label = label
  end
end
