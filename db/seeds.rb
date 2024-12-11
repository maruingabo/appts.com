# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# User.create!(first_name: 'User', middle_name: 'Uno', last_name: 'One', email: 'user@one.com', password: '123456')
# User.create!(first_name: 'User', middle_name: 'Dos', last_name: 'Two', email: 'user@two.com', password: '123456')

# Province.create!(name: 'Palawan', code: 'PLW', slug: 'palawan')

# City.create!(name: 'Puerto Princesa City', code: 'PPC', province: Province.first)
# City.create!(name: 'Narra', code: 'NRA', province: Province.first)
# City.create!(name: 'Brookes Point', code: 'BP', province: Province.first)

# Establishment.create!(name: 'Establishment One', address: 'Address 1', phone_number: '12121', subdomain: 'estone', domain: 'estone.com', city: City.first)
# Establishment.create!(name: 'Establishment Two', address: 'Address 1', phone_number: '12112121', subdomain: 'esttwo', domain: 'esttwo.com', city: City.second)
# Establishment.create!(name: 'Establishment One', address: 'Address 1', phone_number: '12121', subdomain: 'estone', domain: 'estone.com')

# EstablishmentsUser.create!(user: User.first, establishment: Establishment.first)
# EstablishmentsUser.create!(user: User.second, establishment: Establishment.second)

# ServiceOffer.create!(establishment: Establishment.first, name: 'Est1 Service 1', price: 1200)
# ServiceOffer.create!(establishment: Establishment.first, name: 'Est1 Service 2', price: 1300)
# ServiceOffer.create!(establishment: Establishment.first, name: 'Est1 Service 3', price: 1400)
# ServiceOffer.create!(establishment: Establishment.first, name: 'Est1 Service 4', price: 1500)

# ServiceOffer.create!(establishment: Establishment.second, name: 'Est2 Service 1', price: 1200)
# ServiceOffer.create!(establishment: Establishment.second, name: 'Est2 Service 2', price: 1300)
# ServiceOffer.create!(establishment: Establishment.second, name: 'Est2 Service 3', price: 1400)
# ServiceOffer.create!(establishment: Establishment.second, name: 'Est2 Service 4', price: 1500)

Booking.create!(establishment: Establishment.first, booked_date: (DateTime.now + 2), first_name: 'patient1', last_name: ' est1', middle_name: 'uno')
Booking.create!(establishment: Establishment.first, booked_date: (DateTime.now + 2), first_name: 'patient2', last_name: ' est1', middle_name: 'uno')
Booking.create!(establishment: Establishment.first, booked_date: (DateTime.now + 2), first_name: 'patient3', last_name: ' est1', middle_name: 'uno')
Booking.create!(establishment: Establishment.first, booked_date: (DateTime.now + 2), first_name: 'patient4', last_name: ' est1', middle_name: 'uno')

Booking.create!(establishment: Establishment.second, booked_date: (DateTime.now + 3), first_name: 'patient1', last_name: ' est2', middle_name: 'dos')
Booking.create!(establishment: Establishment.second, booked_date: (DateTime.now + 3), first_name: 'patient2', last_name: ' est2', middle_name: 'dos')
Booking.create!(establishment: Establishment.second, booked_date: (DateTime.now + 3), first_name: 'patient3', last_name: ' est2', middle_name: 'dos')
Booking.create!(establishment: Establishment.second, booked_date: (DateTime.now + 3), first_name: 'patient4', last_name: ' est2', middle_name: 'dos')
