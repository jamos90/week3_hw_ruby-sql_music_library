require('pg')
# require_relative()

class MusicFan

attr_accessor(:name)
attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

#   def save()
#     sql = "INSERT INTO customers
#     (
#       name
#     )
#       VALUES
#     (
#       $1
#     )
#     RETURNING id"
#     values = [@name]
#     result = SqLRunner.run(sqk, values)
#     @id = result[0]['id'].to_i
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM customers"
#     SqlRunner.run(sql)
#   end
#
#   def self.all()
#     sql = "SELECT * FROM customers" #plural! (S)
#     SqlRunner.run(sql)
#     return customers.map { |person| Customers.new(person) }
#   end
#
#   def pizza_orders()
#     sql = 'SELECT * FROM pizza_orders WHERE customer_id = $1'
#     values = [@id]
#     pizza_orders = SqlRunner.run(sql, values)
#     return pizza_orders.map { |order| PizzaOrder.new(order) }
#   end
#
# end
