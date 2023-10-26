require 'date'
require_relative '../classes/item'
require_relative '../classes/author'

describe Author do
  let(:author) do
    Author.new(1, 'Ahmad', 'Ahmadi')
  end

  before(:each) do
    @item1 = Item.new(11, 'Title', Date.new(2020, 0o1, 0o1))
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

  describe '#to_json & #from_json' do
    it 'returns a JSON representation of the author' do
      author = Author.new(1, 'John', 'Doe')
      expected_json = {
        'class_name' => 'Author',
        'id' => 1,
        'first_name' => 'John',
        'last_name' => 'Doe'
      }
      expect(author.to_json).to eq(expected_json)
    end

    it 'creates an Author object from JSON data' do
      data = {
        'class_name' => 'Author',
        'id' => 2,
        'first_name' => 'Jane',
        'last_name' => 'Smith'
      }
      author = Author.from_json(data)
      expect(author).to be_an_instance_of(Author)
      expect(author.id).to eq(2)
      expect(author.first_name).to eq('Jane')
      expect(author.last_name).to eq('Smith')
    end
  end
end
