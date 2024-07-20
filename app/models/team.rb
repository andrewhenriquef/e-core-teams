# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :roles, through: :memberships
end
