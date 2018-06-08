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

customer2 = Customer.new({
   'name' => 'Brucey Bonus','funds' => 20})
customer2.save()

customer3 = Customer.new({
   'name' => 'Ronald McDonald','funds' => 50})
customer3.save()

customer4 = Customer.new({
   'name' => 'Paul Chuckle','funds' => 150})
customer4.save()

film1 = Film.new({
   'title' => 'The day it rained hammers',
    'price' => 7})
film1.save()

film2 = Film.new({
   'title' => 'The day it snowed fire',
    'price' => 7})
film2.save()

film3 = Film.new({
   'title' => 'The day the sky was too low',
    'price' => 8})
film3.save()

film4 = Film.new({
   'title' => 'The day cars were suddenly snakes: 3D',
    'price' => 13})
film4.save()

film5 = Film.new({
  'title' => 'The day oven gloves were only made of paper: IMAX',
  'price' => 13})

ticket1 = Ticket.new({
   'customer_id'=> customer1.id,
    'film_id' => film1.id })
ticket1.save()

ticket2 = Ticket.new({
   'customer_id'=> customer1.id,
    'film_id' => film5.id })
ticket2.save()

ticket3 = Ticket.new({
   'customer_id'=> customer2.id,
    'film_id' => film3.id })
ticket3.save()

ticket4 = Ticket.new({
   'customer_id'=> customer3.id,
    'film_id' => film2.id })
ticket4.save()

ticket5 = Ticket.new({
   'customer_id'=> customer4.id,
    'film_id' => film4.id })
ticket5.save()


binding.pry
nil
