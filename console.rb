require('pry-byebug')
require('./models/customer.rb')
require('./models/film.rb')
require('./models/ticket.rb')

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

customer1 = Customer.new({
   'name' => 'Barry Chuckle','funds' => 50})
customer1.save()

film1 = Film.new({
   'title' => 'The day it rained hammers',
    'price' => 7})
film1.save()

ticket1 = Ticket.new({
   'customer_id'=> customer1.id,
    'film_id' => film1.id })
ticket1.save()


binding.pry
nil
