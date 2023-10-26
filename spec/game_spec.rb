require 'date'
require_relative '../classes/item'
require_relative '../classes/author'
require_relative '../classes/game'

describe Game do
  let(:author) { Author.new(1, "Bashar", "Jawad") }
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:last_played_at) { Date.new(2020, 1, 1) }

  before(:each) do
    @game = Game.new('Game Title', publish_date, true, last_played_at, author)
  end

  describe "When testing the Game classe" do
    it "sets the title, author, publish_date, multiplayer, and last_played_at attributes" do
      expect(@game.title).to eq('Game Title')
      expect(@game.author).to eq(author)
      expect(@game.publish_date).to eq(publish_date)
      expect(@game.multiplayer).to be true
      expect(@game.last_played_at).to eq(last_played_at)
    end
  end

end
