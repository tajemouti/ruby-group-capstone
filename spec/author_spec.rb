require 'date'
require_relative '../classes/item'
require_relative '../classes/author'

describe Author do
  let(:author) do
    Author.new(1, 'Ahmad', 'Ahmadi')
  end

  before(:each) do
    @item1 = Item.new(11, 'Title', Date.new(2020,01,01))
  end
  describe 'When testing the Author class' do
    it 'Sets the first_name attribute' do
      expect(author.first_name).to eq('Ahmad')
    end
    it 'Sets the last_name attribute' do
      expect(author.last_name).to eq('Ahmadi')
    end
    it 'Initialize an empty items arrary' do
      expect(author.items).to be_empty
    end
  end

  describe 'The add_item method should work properly' do
    it "Add the item to author's items collection" do
      author.add_item(@item1)
      expect(author.items).to contain_exactly(@item1)
    end
  end


end
