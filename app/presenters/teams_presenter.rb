# frozen_string_literal: true

class TeamsPresenter
  include Alba::Resource

  root_key :team, :teams

  attributes :id, :name, :description
end
