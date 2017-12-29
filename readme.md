# JSON-Filestore-Ruby
A pseudo-nosql database / JSON file storage solution built in Ruby.
Authored by yours truly, X J. Coan

## File Structure
There are two folders: src and datastore

/src/ contains all relevant files for the DB
* `db_cli.rb` - a command line tool to manage your databases, tables/key-value pairs, etc.  Still a work-in-progress
* `store.rb` - contains all the logic for storing and retrieving data from your databases

`/datastore/` contains the JSON files of your databases, created from the CLI or store.

## API Reference
`store.rb` contains a class with several methods.  The file will have to be referenced with `require`, `require_relative`, etc.

To initiate an datastore instance, call Store.new.  The three arguments required are `name` (a string), `data` (a hash), and `path` (where you want to save the file).  Please be sure the path exists before running your code (`store.rb` doesn't create directories).

Note that creating an instance of Store does NOT save the data.  You will have to call the method `write` on your instance to do so.

Store contains the following methods:
* `write` - Saves your data to the filename and path specified.
* `read` - Attempts to find an existing JSON store with your specified name and path and load data from the file into an instance variable.  This will overwrite any data existing in your instantiated Store.
* `add(key, value)` - adds a Key/Value pair to the data.
Each method contains above also contains a verification method (e.g. `read_and_verify` that will return true/false when successful)

The following methods are essentially aliases for standard ruby hash methods, but work off of the data stored in your Store object. This way you don't need to save a duplicate of your data in your program's runtime.
* `value(key)` - Returns the value associated with a key.
* `contains?(key)` - Returns true/false if the Store object instance contains a key.
* `keys` Returns all keys in the Store object's instanced data

The following instance variables all have getters and setters:
* `name`
* `data`
* `path`

### Additional Info
This should work with most Ruby versions, but was built with the Ruby 2.3 docs as reference.

#### Can I use this?
Sure, but you'd probably be better off using MongoDB or something.
There is an MIT license, so feel free to use this.
