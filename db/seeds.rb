# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
l1 = List.create(:name => "Stupid Super Powers", :items_name => "Stupid Super Power")
l2 = List.create(:name => "Startup Ideas", :items_name => "idea")

l1.items << Item.create(:name => "Transform all women underware into fine tangas.")
l1.items << Item.create(:name => "Steam/unsteam any form of glasses.")
l1.items << Item.create(:name => "Transform slices of bread into bread and tomato.")

l2.items << Item.create(:name => "Git time lapse")