# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Team.create(name: 'N3', description: 'Support team for N3')
Team.create(name: 'Delivery', description: 'Delivery new features')

Role.create(name: 'developer')
Role.create(name: 'Product Owner')
Role.create(name: 'Tester')

User.create(name: 'John Doe')
User.create(name: 'Jane Doe ')
User.create(name: 'Janet Doe')

Membership.create(user: User.first, team: Team.first, role: Role.first)
Membership.create(user: User.first, team: Team.last, role: Role.first)
