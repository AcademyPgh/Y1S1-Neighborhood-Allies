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


##Funders and their Categories!

f = Funder.create(name:"Neighborhood Allies")
fca = FundCatA.create(name: "Type of Investment", funder_id: f.id)
FundCatB.create(name: "Catalytic", fund_cat_a_id: fca.id)
FundCatB.create(name: "Small and Simple", fund_cat_a_id: fca.id)
FundCatB.create(name: "Loan", fund_cat_a_id: fca.id)




f = Funder.create(name: "Hillman Foundation")
FundCatA.create(name: "Culture and Arts", funder_id: f.id)
FundCatA.create(name: "Community and Economic Development", funder_id: f.id)
FundCatA.create(name: "Education", funder_id: f.id)
FundCatA.create(name: "Human and Social Services", funder_id: f.id)
FundCatA.create(name: "Health", funder_id: f.id)
FundCatA.create(name: "Environment/Conservation", funder_id: f.id)

f = Funder.create(name: "RK Mellon Foundation")
FundCatA.create(name: "Economic Development and Conservation", funder_id: f.id)
FundCatA.create(name: "Education", funder_id: f.id)
FundCatA.create(name: "Human Services", funder_id: f.id)
FundCatA.create(name: "NonProfit Capacity Building", funder_id: f.id)

f = Funder.create(name: "McCune Foundation")
FundCatA.create(name: "Education", funder_id: f.id)
FundCatA.create(name: "Human Services", funder_id: f.id)
FundCatA.create(name: "Humanities", funder_id: f.id)
FundCatA.create(name: "Services", funder_id: f.id)

f = Funder.create(name: "Pittsburgh Foundation")
FundCatA.create(name: "Public Privacy and Advocacy", funder_id: f.id)
FundCatA.create(name: "Community Development", funder_id: f.id)
FundCatA.create(name: "Health and Human Services", funder_id: f.id)
FundCatA.create(name: "Arts and Education", funder_id: f.id)
FundCatA.create(name: "Social Innovation, Special Research and Special Initiatives", funder_id: f.id)

f = Funder.create(name: "Buhl Foundation")
FundCatA.create(name: "Education", funder_id: f.id)
FundCatA.create(name: "Youth Development", funder_id: f.id)
FundCatA.create(name: "Human Services", funder_id: f.id)
FundCatA.create(name: "Economic and Community Development", funder_id: f.id)


SocialType.create(socType: "Twitter")
SocialType.create(socType: "Facebook")
SocialType.create(socType: "Instagram")

OrgStatus.create(orgStatus: "501(C)3")
OrgStatus.create(orgStatus: "B-Corp")
OrgStatus.create(orgStatus: "For Profit")
OrgStatus.create(orgStatus: "Other")

PAoS.create(area: "Hilltop - Allentown")
PAoS.create(area: "Hilltop - Beltzhoover")
PAoS.create(area: "Hilltop - Knoxville")
PAoS.create(area: "Hill District")
PAoS.create(area: "Homewood")
PAoS.create(area: "Larimer")
PAoS.create(area: "Hilltop - Allentown")
PAoS.create(area: "Millvale")
PAoS.create(area: "Wilkinsburg")
PAoS.create(area: "Other")

FundingType.create(fundtype: "In Kind")
FundingType.create(fundtype: "Cash")

FundingSent.create(organization_id_sent: 1, organization_id_received: 2, funding_type_id: 1)
FundingSent.create(organization_id_sent: 2, organization_id_received: 1, funding_type_id: 2)
FundingSent.create(organization_id_sent: 2, organization_id_received: 3, funding_type_id: 1)
FundingSent.create(organization_id_sent: 2, organization_id_received: 4, funding_type_id: 1)