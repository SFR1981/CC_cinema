
class Customer

attr_reader :id
attr_accessor :name, :funds



def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @funds = options['funds']


end

def save
  sql = "INSERT INTO customers (name, funds)
  VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end


def delete
  sql = "DELETE FROM customers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

def update
  sql = "UPDATE customers SET (name, funds) = ($1,$2) WHERE id = $3"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end

def films()
  sql = "SELECT films.* FROM films
  INNER JOIN screenings ON screenings.film_id = films.id
  INNER JOIN tickets ON screenings.id = tickets.screening_id
  INNER JOIN customers ON tickets.customer_id = customers.id WHERE customers.id = $1"
  values = [@id]
  films = SqlRunner.run(sql,values)
  return Film.map_items(films)



end

def paying(film)  #this is for tickets in the setup
sql = "SELECT films.* FROM films WHERE id = $1"
values = [film.id]
transaction = SqlRunner.run(sql,values)[0]
self.funds -= transaction['price'].to_i
self.update


end

def buys(film, screening)  #this is for new tickets which appear in the tables
sql = "SELECT films.* FROM films WHERE id = $1"
values = [film.id]
transaction = SqlRunner.run(sql,values)[0]
self.funds -= transaction['price'].to_i
self.update
sql = "SELECT screenings.* FROM screenings WHERE screenings.id = $1 AND screenings.film_id = $2"
values = [screening.id, film.id]
screening_verified = SqlRunner.run(sql,values)[0]

ticket = Ticket.new({
   'customer_id'=> self.id,
    'screening_id' => screening_verified['id'] })
ticket.save()


end

def tickets()
sql = "SELECT tickets.* FROM tickets WHERE customer_id = $1"
values = [@id]
SqlRunner.run(sql, values).ntuples


end







def self.all()
  sql = "SELECT * FROM customers"
  values = []
  customers = SqlRunner.run(sql, values)
  return Customer.map_items(customers)

  end

def self.map_items(customer_data)
  return customer_data.map { |customer| Customer.new(customer)}

  end


def self.delete_all()
  sql = "DELETE FROM customers"
  values = []
  SqlRunner.run(sql, values)
end



end
