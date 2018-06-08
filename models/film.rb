require_relative("../db/sql_runner")

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
