# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(name: 'marcos', surname: 'ojeda', tradename: 'contable', phone: '2949')
ServiceOrder.create(creation_date_at: Time.now, last_move_date_at: Time.now, estate: 'en espera', customer_id: Customer.first )