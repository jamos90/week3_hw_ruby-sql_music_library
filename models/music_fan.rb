require('pg')
# require_relative()

class MusicFan

attr_accessor(:name)
attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
