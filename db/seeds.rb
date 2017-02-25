# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users1 =  User.create([{name: "user1", accountId: "5afa11cc336145748adc3aa21a54e012"}, 
                       {name: "user2", accountId: "f6eb63a95c784c2f8e3387e3a1a0f78c"}, 
                       {name: "user3", accountId: "f7bac53088cd45a1b444e4b4d3349e4c"},
                       {name: "user4", accountId: "a7bbb93babb6414ba306bf55032cdb9b"},
                       {name: "user5", accountId: "0e9e3881d67f41a58b5e5cd646569203"}])
users2 =  User.create([{name: "user6", accountId: "null"},
                       {name: "user7", accountId: "e30ab137b8d54c2fb2f12f2bbc98fbab"},
                       {name: "user8", accountId: "null"},
                       {name: "user9", accountId: "9de7dcdc0d614dc2be9d5640ccf028e7"},
                       {name: "user10", accountId: "null"}])
  
team1 = Team.create(full_name: "The Team", tag_name: "TT")
team2 = Team.create(full_name: "Team no.1", tag_name: "N1")

team1.users << users1
team2.users << users2

Tournament.create(title: "Tournament #1", max_team: 16, tournament_begins: "18.02.2017 16:00")
AdminUser.create(login: "admin")
