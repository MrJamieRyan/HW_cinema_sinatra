require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')
require_relative('./models/screening')
require('pry')

Ticket.delete_all
Customer.delete_all
Film.delete_all
Screening.delete_all

customer1 = Customer.new({
  'name' => 'Jamie',
  'funds' => 100
  })

customer1.save()

customer2 = Customer.new({
  'name' => 'Lauren',
  'funds' => 200
  })

customer2.save()

customer3 = Customer.new({
  'name' => 'Loki',
  'funds' => 300
  })

customer3.save()


film1 = Film.new({
  'title' => 'Saving Private Ryan',
  'price' => 10
  })

film1.save()

film2 = Film.new({
  'title' => 'Nightmare Before Christmas',
  'price' => 10
  })

film2.save()

film3 = Film.new({
    'title' => 'Lassie',
    'price' => 10
    })

film3.save()

screening1 = Screening.new({'film_id' => film1.id, 'date' => '01.01.2020', 'time' => '5pm', 'limit' => 50})

screening1.save()

screening2 = Screening.new({'film_id' => film2.id, 'date' => '01.01.2020', 'time' => '8pm', 'limit' => 3})

screening2.save()

screening3 = Screening.new({'film_id' => film3.id, 'date' => '01.01.2020', 'time' => '11pm', 'limit' => 100})

screening3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening2.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening2.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening1.id})
ticket4.save()

ticket5 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening3.id})
ticket5.save()

ticket6 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening1.id})
ticket6.save()

film1.title = "Avengers: Infinity War"
film1.update
ticket1.customer_id = customer3.id
ticket1.update
customer2.name = "Lauren"
customer2.update

binding.pry
nil
