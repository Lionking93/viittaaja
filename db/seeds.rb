# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create username:"default"

rl = Referencelist.create user:user, name:"default list"

rl.references.create author:"Martin, Robert", title:"Clean code: a handbook of agile software craftmanship", year:2008, publisher:"Prentice Hall"
rl.references.create year:2005, author:"Matti Meikäläinen", publisher:"Ötävå", title:"asdasdasdasdas", volume:2
rl.references.create year:2028, author:"Maasddsa eikäläcsadsainen", publisher:"Ötävå", title:"PPDSOAODPPDSA"
