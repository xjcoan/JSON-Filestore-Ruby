def print_choices
  puts 'Input selection from below: '
  choices = [
    '1 - View all existing databases',
    '2 - Delete Database',
    '3 - Get keys from database',
    '4 - Lookup Value',
    '5 - Exit'
  ]
  choices.each do |f|
    puts f
  end
end

def humanize_file(path)
  tokens = path.split('/').last
  file = tokens.last
  file
end

def find_files
  Dir["#{construct_path}/**/*.json"]
end

def find_path(name)
  construct_path + name
end

def construct_path
  path = __dir__.to_s + '/../datastore/'
  path
end

def input_name
  puts 'Enter database name (with .json)'
  gets
end

# Choice 1 - list all databases
def list_databases
  if find_files.any?
    puts 'Databases found:'
    files = []
    find_files.each do |path|
      files.push(humanize_file(path))
    end
    puts files + "\n"
  else
    puts "No databases found in directory\n"
  end
end

def delete_database
  name = input_name
  if File.file?(find_path(name))
    File.delete(find_path(name))
    puts "Database deleted successfully\n"
  else
    puts "No Database found with name\n"
  end
end

def display_keys
  name = input_name
  if file_exists?(find_path(name))
    data = read_data(find_path(name))
    puts data + "\n"
  else
    puts "Could not find database with name\n"
  end
end

def read_data(path)
  return unless File.file?(path)
  file = File.read(path)
  data_hash = JSON.parse(file)
  data_hash
end

def file_exists?(path)
  if File.file?(path)
    true
  else
    false
  end
end

def display_value
  name = input_name
  puts 'Enter Key'
  key = gets
  if file_exists(find_path(name))
    data_hash = read_data(find_path(name))
    if data_hash.key?(key)
      puts data_hash[key] + "\n"
    else
      puts "Could not find key in data\n"
    end
  else
    puts "Could not find database with name\n"
  end
end

puts 'Ruby NoSQL CLI'
print_choices
loop do
  puts 'Select Choice'
  choice = gets.chomp
  puts "\n"
  case choice
  when '1'
    list_databases
  when '2'
    delete_database
  when '3'
    display_keys
  when '4'
    display_value
  when '5'
    puts 'exiting'
    break
  when 'help'
    print_choices
  else
    puts 'Invalid option, select again'
  end
end
