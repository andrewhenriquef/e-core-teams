# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :roles, through: :memberships
  belongs_to :team_lead, class_name: 'User', foreign_key: 'team_lead_id', optional: true

  validates :name, presence: true
end
