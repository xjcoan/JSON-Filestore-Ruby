require 'json'
# Class Store defines database funcitonality
class Store
  attr_reader :name
  attr_accessor :path, :data
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

  # Read data from file if file exists
  def read
    if File.file?(@path + "#{@name}.json")
      file = File.read(@path + "#{@name}.json")
      @data = JSON.parse(file)
      @data
    else
      {} # returns blank hash if file not present
    end
  end

  # Return value from dataset with given key. Will return nil if key not found
  def find(key)
    @data[key]
  end

  # Return all keys contained in hash set
  def keys
    @data.keys
  end
end
