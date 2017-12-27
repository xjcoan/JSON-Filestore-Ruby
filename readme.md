# RubyNoSQL
A pseudo-nosql database / JSON file storage solution built in Ruby

## Why?
Why not?

## Can I use this?
Sure, but you'd probably be better off using MongoDB or something.

### How does it work?
There are two folders: src and datastore

/src/ contains all relevant files for the DB
* `db_cli.rb` - a command line tool to manage your databases, tables/key-value pairs, etc.
* `store.rb` - contains all the logic for storing and retrieving data from your databases

`/datastore/` contains the JSON files of your databases, created from the CLI or store.
