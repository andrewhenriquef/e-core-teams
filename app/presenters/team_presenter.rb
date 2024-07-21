# frozen_string_literal: true

class TeamPresenter
  include Alba::Resource

  attributes :id, :name, :description
  many :users, resource: UsersPresenter
end
