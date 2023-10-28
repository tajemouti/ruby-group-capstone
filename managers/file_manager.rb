def save_items_to_json(items)
    serialized_items = items.map(&:to_json)
    write_json_to_file('./data/items.json', serialized_items)
  end
  
  def write_json_to_file(file_name, data)
    File.open(file_name, 'w') do |file|
      file.puts data.to_json
    end
  end
  
  def load_items_from_json
    return [] unless File.exist?('./data/items.json')
  
    class_mapping = {
      'Book' => Book,
      'Label' => Label,
      'MusicAlbum' => MusicAlbum,
      'Genre' => Genre,
      'Game' => Game,
      'Author' => Author
    }
    json_data = JSON.parse(File.read('./data/items.json'))
    json_data.map do |item_data|
      class_name = item_data['class_name']
      class_mapping[class_name].from_json(item_data)
    end.compact
  end
  