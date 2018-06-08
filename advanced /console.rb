require('pry-byebug')
require('./models/customer.rb')
require('./models/film.rb')
require('./models/ticket.rb')
require('./models/screenings.rb')

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()
Screening.delete_all()

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
  film5.save()


screening1 = Screening.new({
   'film_id' => film1.id,
   'show_time' => "09:00"
  })
screening1.save()

screening2 = Screening.new({
   'film_id' => film2.id,
   'show_time' => "12:00"
  })
screening2.save()

screening3 = Screening.new({
   'film_id' => film3.id,
   'show_time' => "14:30"
  })
screening3.save()

screening4 = Screening.new({
   'film_id' => film4.id,
   'show_time' => "13:50"
  })
screening4.save()

screening5 = Screening.new({
   'film_id' => film5.id,
   'show_time' => "15:00"
  })
screening5.save()

screening6 = Screening.new({
   'film_id' => film4.id,
   'show_time' => "23:45"
  })
screening6.save()

ticket1 = Ticket.new({
   'customer_id'=> customer1.id,
    'screening_id' => screening1.id })
ticket1.save()

ticket2 = Ticket.new({
   'customer_id'=> customer1.id,
    'screening_id' => screening2.id })
ticket2.save()

ticket3 = Ticket.new({
   'customer_id'=> customer2.id,
    'screening_id' => screening3.id })
ticket3.save()

ticket4 = Ticket.new({
   'customer_id'=> customer3.id,
    'screening_id' => screening4.id })
ticket4.save()

ticket5 = Ticket.new({
   'customer_id'=> customer4.id,
    'screening_id' => screening5.id })
ticket5.save()

ticket6 = Ticket.new({
   'customer_id'=> customer1.id,
    'screening_id' => screening5.id })
ticket6.save()

ticket7 = Ticket.new({
   'customer_id'=> customer2.id,
    'screening_id' => screening5.id })
ticket7.save()

ticket8 = Ticket.new({
   'customer_id'=> customer3.id,
    'screening_id' => screening5.id })
ticket8.save()

ticket9 = Ticket.new({
   'customer_id'=> customer3.id,
    'screening_id' => screening6.id })
ticket9.save()



binding.pry
nil
