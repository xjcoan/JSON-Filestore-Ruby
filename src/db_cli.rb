def print_choices
  puts 'Input selection from below: '
  choices = [
    '1 - View all existing databases',
    '2 - Delete Database',
    '3 - Get keys from database',
    '4 - Get value from database'
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
  pathnames = Dir["#{construct_path}/**/*.json"]
  pathnames
end

def find_path(name)
  construct_path + name
end

def construct_path
  path = __dir__.to_s + "/../datastore/"
  path
end

# Choice 1 - list all databases
def list_databases
  pathnames = find_files
  if pathnames.any?
    puts 'Databases found:'
    files = []
    pathnames.each do |path|
      files.push(humanize_file(path))
    end
    puts files
  else
    puts 'No databases found in directory'
  end
  puts "\n"
end

def delete_database
  puts 'Enter database name (with .json)'
  name = gets
  if File.file?(find_path(name))
    File.delete(find_path(name))
    puts "Database deleted successfully\n"
  else
    puts "No Database found with name\n"
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
    puts 'exiting'
    break
  when 'help'
    print_choices
  else
    puts 'Invalid option, select again'
  end
end
