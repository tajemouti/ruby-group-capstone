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
end
