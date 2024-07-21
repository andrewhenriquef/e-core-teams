# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Role.create(name: 'developer')
Role.create(name: 'product owner')
Role.create(name: 'tester')

6.times do
  User.create(name: Faker::Name.name)
end

Team.create(name: 'N3', description: 'Support team for N3')
Team.create(name: 'Delivery', description: 'Delivery new features')

roles = Role.all
users = User.all.first(3)

3.times do |index|
  Membership.create(user: users[index], team: Team.first, role: roles[index])
end

users = User.all.last(3)

3.times do |index|
  Membership.create(user: users[index], team: Team.last, role: roles[index])
end

Team.first.update(team_lead: User.first)
Team.last.update(team_lead: User.last)
