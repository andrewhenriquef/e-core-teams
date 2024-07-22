# frozen_string_literal: true

class RoleMembershipsPresenter
  include Alba::Resource

  root_key :role, :roles

  attributes :id, :name, :description
  many :memberships, resource: MembershipsPresenter
end
