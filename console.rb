# Your app should have:
# Customers
# name
# funds

# Films
# title
# price

# Tickets
# customer_id
# film_id

require_relative('models/customer.rb')
require_relative('models/ticket.rb')
require_relative('models/film.rb')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({ 'name' => 'Paul', 'funds' => '60'})
customer2 = Customer.new({ 'name' => 'Phill', 'funds' => '38'})
customer3 = Customer.new({ 'name' => 'Helen', 'funds' => '45'})
customer4 = Customer.new({ 'name' => 'Jerine', 'funds' => '50'})
customer5 = Customer.new({ 'name' => 'Ted', 'funds' => '20'})
customer6 = Customer.new({ 'name' => 'Eli', 'funds' => '20'})
customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()

film1 = Film.new({ 'title' => 'A Bugs Life III', 'price' => '5'})
film2 = Film.new({ 'title' => 'Three men and a baby', 'price' => '7'})
film3 = Film.new({ 'title' => 'Ghost Busters, The return of Mello-man', 'price' => '8'})
film4 = Film.new({ 'title' => 'Lord of the Dance', 'price' => '2'})
film5 = Film.new({ 'title' => 'CodeClan - The Documentary', 'price' => '4'})
film6 = Film.new({ 'title' => 'Space Stuff goes BANG', 'price' => '10'})
film1.save()
film2.save()
film3.save()
film4.save()
film5.save()
film6.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id(), 'film_id' => film6.id()})
ticket2 = Ticket.new({ 'customer_id' => customer1.id(), 'film_id' => film3.id()})
ticket2 = Ticket.new({ 'customer_id' => customer1.id(), 'film_id' => film2.id()})
ticket3 = Ticket.new({ 'customer_id' => customer2.id(), 'film_id' => film6.id()})
ticket4 = Ticket.new({ 'customer_id' => customer2.id(), 'film_id' => film3.id()})
ticket5 = Ticket.new({ 'customer_id' => customer2.id(), 'film_id' => film1.id()})
ticket6 = Ticket.new({ 'customer_id' => customer3.id(), 'film_id' => film2.id()})
ticket7 = Ticket.new({ 'customer_id' => customer3.id(), 'film_id' => film4.id()})
ticket8 = Ticket.new({ 'customer_id' => customer3.id(), 'film_id' => film1.id()})
ticket9 = Ticket.new({ 'customer_id' => customer4.id(), 'film_id' => film1.id()})
ticket10 = Ticket.new({ 'customer_id' => customer4.id(), 'film_id' => film4.id()})
ticket11 = Ticket.new({ 'customer_id' => customer5.id(), 'film_id' => film1.id()})
ticket12 = Ticket.new({ 'customer_id' => customer6.id(), 'film_id' => film1.id()})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()
ticket8.save()
ticket9.save()
ticket10.save()
ticket11.save()
ticket12.save()

# to use pry as interface after above code has run
binding.pry

nil
