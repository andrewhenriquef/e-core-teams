# frozen_string_literal: true

class RolesPresenter
  include Alba::Resource

  root_key :role, :roles

  attributes :id, :name, :description
end
