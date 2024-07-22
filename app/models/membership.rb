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
  validates :role_id,
            uniqueness: {
              scope: %i[user_id team_id],
              message: 'should be unique per team and role'
            }

  before_validation :set_default_role, if: -> { role_id.blank? }

  private

  def set_default_role
    self.role_id ||= Role.find_or_create_by(name: 'developer').id
  end
end
