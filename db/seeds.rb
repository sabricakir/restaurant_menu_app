# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([{ name: 'Soğuk içecekler' },
                              { name: 'Sıcak içecekler' },
                              { name: 'Ana yemekler' },
                              { name: 'Tatlılar' },
                              { name: 'Tuzlular' },
                              { name: 'Ekmek arası' }])
User.create(name: 'sabri', surname: 'çakır', email: 'sabricakir86@gmail.com', password: 'şifre123',
            phone: 1_234_567_890)
