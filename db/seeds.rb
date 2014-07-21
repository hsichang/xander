# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(username: 'chango', password: 'password', email_address: 'hsi.chang@gmail.com', superuser: true, active: true)
User.create(username: 'xander', password: 'wallingford', email_address: 'xanderduell@gmail.com', superuser: true, active: true)
