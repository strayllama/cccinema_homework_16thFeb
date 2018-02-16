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


customer1 = Customer.new({ 'name' => 'Paul', 'funds' => '100'})
customer2 = Customer.new({ 'name' => 'Phill', 'funds' => '100'})
customer3 = Customer.new({ 'name' => 'Helen', 'funds' => '100'})
customer4 = Customer.new({ 'name' => 'Jerine', 'funds' => '100'})
customer5 = Customer.new({ 'name' => 'Ted', 'funds' => '50'})
customer6 = Customer.new({ 'name' => 'Eli', 'funds' => '50'})
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

customer1.buy_ticket(film2)
customer1.buy_ticket(film3)
customer1.buy_ticket(film6)
customer2.buy_ticket(film1)
customer2.buy_ticket(film3)
customer2.buy_ticket(film6)
customer3.buy_ticket(film1)
customer3.buy_ticket(film2)
customer3.buy_ticket(film4)
customer4.buy_ticket(film1)
customer4.buy_ticket(film4)
customer5.buy_ticket(film1)
customer6.buy_ticket(film1)



# to use pry as interface after above code has run
binding.pry

nil
