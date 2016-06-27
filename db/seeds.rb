# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.create(name: "Twelve 5 Designs LLC", phone: "4125552121", email: "blah@blah.bla", address: "744 Warrington")
Organization.create(name: "Academy Pgh", phone: "41255555555", email:"john@lange.com", address: "755 Warrington Ave")
Organization.create(name: "Funding Party", phone: "4121233232",email: "funder@funds.com", address "619 Whitney Ave")
Organization.create(name: "PNC Bank", phone: "4123456543", email: "banker@bank.com", address "100 Grant St")
Organization.create(name: "Money Partners", phone: "4129087654", email: "P")

StaffSize.create(size: "0")
StaffSize.create(size:"1-5")
StaffSize.create("5-10")
StaffSize.create("10-20")
StaffSize.create("20-30")
StaffSize.create("30-40")
StaffSize.create("40-50")
StaffSize.create("50+")