# frozen_string_literal: true

class UsersPresenter
  include Alba::Resource

  root_key :user, :users

  attributes :id, :name

  many :roles, resource: RolesPresenter
end
