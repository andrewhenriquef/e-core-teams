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
Role.create(name: 'Product Owner')
Role.create(name: 'Tester')

14.times do
  User.create(name: Faker::Name.name)
end

Team.create(name: 'N3', description: 'Support team for N3')
Team.create(name: 'Delivery', description: 'Delivery new features')

roles = Role.all

users = User.all

7.times do |index|
  if index < 7
    Membership.create(user: users[index], team: Team.first, role: roles.sample)
  else
    Membership.create(user: users[index], team: Team.last, role: roles.sample)
  end
end

Team.first.update(team_lead: User.first)
Team.last.update(team_lead: User.last)
