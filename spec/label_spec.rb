require 'rspec'
require_relative '../classes/label'
describe Label do
  subject { described_class.new(1, 'General', 'red') }

  describe '#id' do
    it 'returns the id' do
      expect(subject.id).to eq 1
    end
  end

  describe '#title' do
    it 'returns the title' do
      expect(subject.title).to eq 'General'
    end
  end

  describe '#color' do
    it 'returns the color' do
      expect(subject.color).to eq 'red'
    end
  end

  describe '#items' do
    it 'returns the items array' do
      expect(subject.items).to eq []
    end
  end

  describe '#add_item' do
    it 'adds the item to the items array' do
      subject.add_item('item1')
      expect(subject.items).to include 'item1'
    end
  end

  describe '#to_json' do
    it 'returns a json representation of the label' do
      expect(subject.to_json).to eq({
                                      'class_name' => 'Label',
                                      'id' => 1,
                                      'title' => 'General',
                                      'color' => 'red'
                                    })
    end
  end

  describe '.from_json' do
    it 'returns a label object from the json data' do
      label = Label.from_json({
                                'class_name' => 'Label',
                                'id' => 1,
                                'title' => 'General',
                                'color' => 'red'
                              })
      expect(label).to be_a Label
      expect(label.id).to eq 1
      expect(label.title).to eq 'General'
      expect(label.color).to eq 'red'
    end
  end
end
