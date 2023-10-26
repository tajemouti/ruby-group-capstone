require 'rspec'
require 'date'
require_relative '../classes/book'
describe Book do
  it 'has accessors for id, title, publish_date, publisher, and cover_state' do
    book = Book.new(1, 'Test Book', Date.today, 'Test Publisher', 'good')
    expect(book.id).to eq(1)
    expect(book.title).to eq('Test Book')
    expect(book.publish_date).to eq(Date.today)
    expect(book.publisher).to eq('Test Publisher')
    expect(book.cover_state).to eq('good')
  end

  it 'can be archived if cover state is bad' do
    book = Book.new(1, 'Test Book', Date.today, 'Test Publisher', 'bad')
    expect(book.can_be_archived?).to eq(true)
  end

  it 'can be serialized to JSON' do
    book = Book.new(1, 'Test Book', Date.today, 'Test Publisher', 'good')
    expect(book.to_json).to eq({
                                 'class_name' => 'Book',
                                 'id' => 1,
                                 'title' => 'Test Book',
                                 'publish_date' => Date.today.strftime('%Y-%m-%d'),
                                 'publisher' => 'Test Publisher',
                                 'cover_state' => 'good'
                               })
  end

  it 'can be deserialized from JSON' do
    data = {
      'class_name' => 'Book',
      'id' => 1,
      'title' => 'Test Book',
      'publish_date' => Date.today.strftime('%Y-%m-%d'),
      'publisher' => 'Test Publisher',
      'cover_state' => 'good'
    }
    book = Book.from_json(data)
    expect(book.id).to eq(1)
    expect(book.title).to eq('Test Book')
    expect(book.publish_date).to eq(Date.today)
    expect(book.publisher).to eq('Test Publisher')
    expect(book.cover_state).to eq('good')
  end
end
