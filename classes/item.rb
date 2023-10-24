require 'date' # Require the Date class

class Item
  attr_accessor :id, :genre, :author, :label, :publish_date
  attr_reader :archived

  def initialize(genre, author, label, publish_date, archived)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return false if @publish_date.nil?

    return true if (Date.today - @publish_date.to_date).to_i > 3650

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
