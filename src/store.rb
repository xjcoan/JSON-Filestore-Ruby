require 'json'
# Class Store defines database funcitonality
class Store
  # Creates getters and setters
  attr_accessor :name, :data, :path
  # Create Database Name/File Name
  def initialize(name, data = {}, path = __dir__ + '/../datastore/')
    @name = name
    @data = data
    @path = path
  end

  # Save database data
  def write
    File.open(@path + "#{@name}.json", 'w') do |f|
      f.write(@data.to_json)
    end
  end

  # Save data and return verification
  def write_and_verify
    File.open(@path + "#{@name}.json", 'w') do |f|
      f.write(@data.to_json)
      true
    end
    false
  end

  # Read data from file if file exists
  def read
    return unless File.file?(@path + "#{@name}.json")
    file = File.read(@path + "#{@name}.json")
    @data = JSON.parse(file)
  end

  # Read data and return verification
  def read_and_verify
    if File.file?(@path + "#{@name}.json")
      file = File.read(@path + "#{@name}.json")
      @data = JSON.parse(file)
      true
    else
      # Return false if can't read file/doesn't exist
      false
    end
  end

  # Return value from dataset with given key. Will return nil if key not found
  def value(key)
    @data[key]
  end

  # Check if key present in dataset
  def contains?(key)
    @data.key?(key)
  end

  # Return all keys contained in hash set
  def keys
    @data.keys
  end

  # Add key to hash
  def add(key, value)
    @data[key] = value
  end

  # Add key to hash with verificaiton
  def add_and_verify(key, value)
    @data[key] = value
    true
  end
end
