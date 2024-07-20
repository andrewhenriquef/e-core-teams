# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
end