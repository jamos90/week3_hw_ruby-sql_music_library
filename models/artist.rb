require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists
    (
      artist_name
    ) VALUES
    (
      $1
    )
    RETURNING id"
    values = [@artist_name]
    new_artist = SqlRunner.run(sql, values)
    @id = new_artist[0]['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET artist_name = $1 WHERE id =$2"
    values = [@artist_name, @id]
    artist_update = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id= $1"
    values = [@id]
    deleted_artist = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    deleted_artists = SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql, values)
    return artist.map {|artist| Artist.new(artist) }

  end

end
