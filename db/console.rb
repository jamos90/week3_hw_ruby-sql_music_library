require('pry')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../db/sql_runner')

Artist.delete_all()
Album.delete_all()


artist1 = Artist.new({
  'artist_name' => 'The Beatles'
  })
artist1.save()

artist2 = Artist.new({
  'artist_name' => 'The Rolling Stones'
  })
artist2.save()

album1 = Album.new({
  'album_name' => 'The White Album',
  'genre' => 'Pop',
  'artist_id' => artist1.id()
  })
album1.save()

album2 = Album.new({
  'album_name' => 'Exile On Main Street',
  'genre' => 'Rock',
  'artist_id' => artist2.id()
  })
album2.save()


binding.pry
nil
