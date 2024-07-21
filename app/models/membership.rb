# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  team_id    :uuid             not null
#  role_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Membership < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :role

  validates :user_id, :team_id, presence: true
end
