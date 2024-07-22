# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Role < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true
end
