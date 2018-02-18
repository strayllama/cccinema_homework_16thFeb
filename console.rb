require_relative('models/customer.rb')
require_relative('models/ticket.rb')
require_relative('models/film.rb')
require_relative('models/screening.rb')

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

# 1 screen at this cinema, so only 1 film at a time. Capacity of 4 seats for testing.
# Price still needs to come from the film.
screening1 = Screening.new({ 'film_id' => film1.id(), 'showing_time' => "9:00" })
screening2 = Screening.new({ 'film_id' => film2.id(), 'showing_time' => "11:00" })
screening3 = Screening.new({ 'film_id' => film4.id(), 'showing_time' => "13:30" })
screening4 = Screening.new({ 'film_id' => film5.id(), 'showing_time' => "16:00" })
screening5 = Screening.new({ 'film_id' => film3.id(), 'showing_time' => "17:45" })
screening6 = Screening.new({ 'film_id' => film6.id(), 'showing_time' => "19:00" })
screening1.save()
screening2.save()
screening3.save()
screening4.save()
screening5.save()
screening6.save()

customer1.buy_ticket(screening2)
customer1.buy_ticket(screening5)
customer1.buy_ticket(screening6)
customer2.buy_ticket(screening1)
customer2.buy_ticket(screening5)
customer2.buy_ticket(screening6)
customer3.buy_ticket(screening1)
customer3.buy_ticket(screening2)
customer3.buy_ticket(screening3)
customer4.buy_ticket(screening1)
customer4.buy_ticket(screening3)
customer5.buy_ticket(screening1)
customer6.buy_ticket(screening1)



# to use pry as interface after above code has run
binding.pry

nil
