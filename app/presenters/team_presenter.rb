# frozen_string_literal: true

class TeamPresenter
  include Alba::Resource

  attributes :id, :name, :description

  one :team_lead, resource: UsersPresenter
  many :users, resource: UsersPresenter
end
