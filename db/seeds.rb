# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.create({name: "Twelve 5 Designs LLC", phone: "4125552121", email: "blah@blah.bla", address: "744 Warrington, Pittsburgh, PA"})
Organization.create({name: "Academy Pgh", phone: "41255555555", email:"john@lange.com", address: "755 Warrington Ave, Pittsburgh, PA"})
Organization.create({name: "Funding Party", phone: "4121233232",email: "funder@funds.com", address: "619 Whitney Ave, Pittsburgh, PA"})
Organization.create({name: "PNC Bank", phone: "4123456543", email: "banker@bank.com", address: "100 Grant St, Pittsburgh, PA"})
Organization.create({name: "Money Partners", phone: "4129087654", email: "Pres@partners.com", address: "240 West Station Square Drive, Pittsburgh, PA"})
Organization.create({name: "NonProfit", phone: "4124567890", email: "Sue@nonprofit.com", address: "177 South Bouquet St, Pittsburgh, PA"})
Organization.create({name: "Investment Inc", phone: "4122122345", email: "Frank@investmentinc.com", address: "2123 Larkins Way, Pittsburgh, PA"})
Organization.create({name: "Neighborhood Allies", phone: "4124713237", email: "info@neighborhoodallies.org", address: "225 Ross Street, Pittsburgh, PA"})
Organization.create({name: "Facebook", phone: "4125672345", email: "mark@facebook.com", address: "120 Casino Drive, Pittsburgh, Pa"})


StaffSize.create(size: "0")
StaffSize.create(size:"1-5")
StaffSize.create(size: "5-10")
StaffSize.create(size: "10-20")
StaffSize.create(size: "20-30")
StaffSize.create(size: "30-40")
StaffSize.create(size: "40-50")

Budget.create(budgetrange: "$0-50k")
Budget.create(budgetrange: "50-100k")
Budget.create(budgetrange: "100-500k")
Budget.create(budgetrange: "500k-1M")
Budget.create(budgetrange: "1-5M")
Budget.create(budgetrange: "5-10M" )
Budget.create(budgetrange: "10M+")

Funder.create(name: "Heinz Foundation")
Funder.create(name: "Hillman Foundation")
Funder.create(name: "RK Mellon Foundation")
Funder.create(name: "McCune Foundation")
Funder.create(name: "Pittsburgh Foundation")
Funder.create(name: "Buhl Foundation")