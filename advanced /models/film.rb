require_relative("../db/sql_runner")
require_relative("screenings")
class Film


  attr_reader :id
  attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options['price']


end


def save
  sql = "INSERT INTO films (title, price)
  VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    user = SqlRunner.run( sql, values ).first
    @id = user['id'].to_i
  end

def delete
  sql = "DELETE FROM films WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

def update
  sql = "UPDATE films SET (title, price) = ($1,$2) WHERE id = $3"
  values = [@title, @price, @id]
  SqlRunner.run(sql, values)
end



def customers()
  sql = "SELECT customers.* FROM customers
INNER JOIN tickets ON customers.id = tickets.customer_id
INNER JOIN screenings ON tickets.screening_id = screenings.id
INNER JOIN films ON screenings.film_id = films.id WHERE films.id =  $1"
  values = [@id]
  films = SqlRunner.run(sql,values)
  return Customer.map_items(films)



end

def number_customers()
  sql = "SELECT customers.* FROM customers
INNER JOIN tickets ON customers.id = tickets.customer_id
INNER JOIN screenings ON tickets.screening_id = screenings.id
INNER JOIN films ON screenings.film_id = films.id WHERE films.id =  $1"
  values = [@id]
  return SqlRunner.run(sql,values).ntuples


end

def screenings()
  sql = "SELECT screenings.* FROM screenings WHERE screenings.film_id = $1"
  values = [@id]
  screenings = SqlRunner.run(sql, values)
  Screening.map_items(screenings)
end


def most_popular_screening

   number = 0
   for screening in self.screenings
     count = screening.tickets_sold
     top = screening if number < count
     number = count
     end
     return "most popular screening is at #{top.show_time}"
end

def money_made
total_revenue = 0
for screening in self.screenings
  total_sold = screening.tickets_sold
  amount = (total_sold  * @price)
  total_revenue += amount
end
return "#{@title} has made £#{total_revenue}"

end


def self.all()
  sql = "SELECT * FROM films"
  values = []
  films = SqlRunner.run(sql, values)
  return Film.map_items(films)

end

def self.map_items(film_data)
  return film_data.map { |film| Film.new(film)}

end


def self.delete_all()
sql = "DELETE FROM films"
values = []
SqlRunner.run(sql,values)

end


end
