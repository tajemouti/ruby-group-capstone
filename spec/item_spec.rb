describe Item do
  it 'returns true if the item can be archived' do
    item = Item.new(1, 'Sample Item', Date.today - 3651)
    expect(item.can_be_archived?).to be true
  end

  it 'returns false if the item cannot be archived' do
    item = Item.new(1, 'Sample Item', Date.today)
    expect(item.can_be_archived?).to be false
  end

  it 'archives the item when it can be archived' do
    item = Item.new(1, 'Sample Item', Date.today - 3651)
    item.move_to_archive
    expect(item.archived).to be true
  end

  it 'keeps the item unarchived when it cannot be archived' do
    item = Item.new(1, 'Sample Item', Date.today)
    item.move_to_archive
    expect(item.archived).to be false
  end
end
