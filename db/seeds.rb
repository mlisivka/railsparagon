# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users1 =  User.create([{name: "user1", email: "user1@g.c", password: "asdasd", password_confirmation: "asdasd"}, 
  {name: "user2", email: "user2@g.c", password: "asdasd", password_confirmation: "asdasd"}, 
  {name: "user3", email: "user3@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user4", email: "user4@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user5", email: "user5@g.c", password: "asdasd", password_confirmation: "asdasd"}])
users2 =  User.create([{name: "user6", email: "user6@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user7", email: "user7@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user8", email: "user8@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user9", email: "user9@g.c", password: "asdasd", password_confirmation: "asdasd"},
  {name: "user10", email: "user10@g.c", password: "asdasd", password_confirmation: "asdasd"}])
  
team1 = Team.create(full_name: "The Team", tag_name: "TT")
team2 = Team.create(full_name: "Team no.1", tag_name: "N1")

team1.users << users1
team2.users << users2

Tournament.create(title: "Tournament #1", max_team: 16, tournament_begins: "18.02.2017 16:00")
AdminUser.create(login: "admin")
