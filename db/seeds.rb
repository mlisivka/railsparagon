# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users1 =  User.create([{name: "user1", accountId: "qweasdzxc"}, 
                       {name: "user2", accountId: "qweasdzxc"}, 
                       {name: "user3", accountId: "qweasdzxc"},
                       {name: "user4", accountId: "qweasdzxc"},
                       {name: "user5", accountId: "qweasdzxc"}])
users2 =  User.create([{name: "user6", accountId: "qweasdzxc"},
                       {name: "user7", accountId: "qweasdzxc"},
                       {name: "user8", accountId: "qweasdzxc"},
                       {name: "user9", accountId: "qweasdzxc"},
                       {name: "user10", accountId: "qweasdzxc"}])
  
team1 = Team.create(full_name: "The Team", tag_name: "TT")
team2 = Team.create(full_name: "Team no.1", tag_name: "N1")

team1.users << users1
team2.users << users2

Tournament.create(title: "Tournament #1", max_team: 16, tournament_begins: "18.02.2017 16:00")
AdminUser.create(login: "admin")
