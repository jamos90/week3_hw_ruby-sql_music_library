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

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE from artists"
    deleted_artists = SqlRunner.run(sql)
  end






# #
#   def self.delete_all()
#     db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
#     sql = "DELETE FROM pizza_orders"
#     db.prepare("delete_all", sql)
#     db.exec_prepared("delete_all")
#     db.close()
#   end
#
#   def customer()
#     sql = "SELECT * FROM customers WHERE id = $1"
#     values = [@customer_id]
#     customers = SqlRunner.run(sql, values).first
#     return Customer.new(customer)
#   end
#
 end
