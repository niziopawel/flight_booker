# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all

Airport.create([
                 {
                   name: 'Hartsfield-Jackson Atlanta International Airport',
                   city: 'Atlanta',
                   country: 'United States',
                   code: 'ATL'
                 },
                 {
                   name: 'Dallas/Fort Worth International Airport',
                   city: 'Dallas',
                   country: 'United States',
                   code: 'DFW'
                 },
                 {
                   name: 'Tokyo Haneda Airport',
                   city: 'Tokyo',
                   country: 'Japan',
                   code: 'HND'
                 },
                 {
                   name: 'Charles de Gaulle',
                   city: 'Roissy-en-France',
                   country: 'France',
                   code: 'CDG'
                 },
                 {
                   name: 'Heathrow Airport',
                   city: 'London',
                   country: 'United Kingdom',
                   code: 'LHR'
                 },
                 {
                   name: 'Frankfurt Airport',
                   city: 'Frankfurt',
                   country: 'Germany',
                   code: 'FRA'
                 },
                 {
                   name: 'Warsaw Chopin Airport',
                   city: 'Warsaw',
                   country: 'Poland',
                   code: 'WAW'
                 }
               ])

p "Created #{Airport.count} airport entries."
