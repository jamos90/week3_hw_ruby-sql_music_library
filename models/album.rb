require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :album_name, :genre, :customer_id
  attr_reader :id

  def initialize(options)
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options ['artist_id'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (
      album_name,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@album_name, @genre, @artist_id]
    new_album = SqlRunner.run(sql, values)
    @id = new_album[0]['id'].to_i
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values =[@artist_id]
    artists = SqlRunner.run(sql, values)
    return artists.map{|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE albums SET album_name = $1 WHERE id =$2"
    values = [@album_name, @id]
    artist_update = SqlRunner.run(sql, values)
  end

  def delete_album
    sql = "DELETE from albums WHERE id = $1"
    values = [@id]
    deleted_album = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album) }
  end

  def self.delete_all()
    sql = "DELETE from albums"
    deleted_albums = SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values)
    return album.map {|album| Album.new(album)}

  end


end
