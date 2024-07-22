# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :roles, through: :memberships
  has_many :led_teams, class_name: 'Team', foreign_key: 'team_lead_id'

  validates :name, presence: true
end
