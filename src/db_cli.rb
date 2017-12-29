require 'json'

# Display choices to user
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

# Display only files names and not the whole path
def humanize_file(path)
  name = path.split('/').last
  name.split('.').first
end

# Return all files found in /datastore/
def find_files
  Dir["#{base_path}/*.json"]
end

# Append the JSON file name to the path
def construct_path(name)
  base_path + name + '.json'
end

# Point to the /datastore/ folder
def base_path
  path = __dir__.to_s + '/../datastore/'
  path
end

# Get the name of the JSON "Database"
def input_name
  puts 'Enter database name'
  gets.chomp
end

# Choice 1 - list all databases
def list_databases
  if find_files.any?
    puts 'Databases found:'
    files = []
    find_files.each do |path|
      files.push(humanize_file(path))
    end
    puts files
  else
    puts 'No databases found in directory'
  end
  puts "\n"
end

# Choice 2 - Delete a datbase
def delete_database
  name = input_name
  if File.file?(construct_path(name))
    File.delete(construct_path(name))
    puts 'Database deleted successfully'
  else
    puts 'No Database found with name'
  end
  puts "\n"
end

# Choice 3 - Display all keys found in given database
def display_keys
  name = input_name
  if file_exists?(construct_path(name))
    data = read_data(construct_path(name))
    puts 'Data found:'
    puts data.keys
  else
    puts 'Could not find database with name'
  end
  puts "\n"
end

# Read JSON from file
def read_data(path)
  return unless File.file?(path)
  file = File.read(path)
  # Convert JSON to ruby Hash
  data_hash = JSON.parse(file)
  data_hash
end

# Check if file exists at given path
def file_exists?(path)
  if File.file?(path)
    true
  else
    false
  end
end

# Get the key from user
def input_key
  puts 'Enter Key'
  gets.chomp
end

# Choice 4 - Get a value from a specified file & key
def display_value
  name = input_name
  if file_exists?(construct_path(name))
    data = read_data(construct_path(name))
    key = input_key
    if data.key?(key)
      puts data[key]
      puts "\n"
    else
      puts 'Could not find key in data'
    end
  else
    puts 'Could not find database with name'
  end
  puts "\n"
end

# Main loop - accept commands from user
puts 'Ruby NoSQL CLI'
print_choices
loop do
  puts 'Select Choice'
  choice = gets.chomp.downcase
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
