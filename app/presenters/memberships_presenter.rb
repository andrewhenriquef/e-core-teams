# frozen_string_literal: true

class MembershipsPresenter
  include Alba::Resource

  root_key :membership, :memberships

  attributes :id

  one :role, resource: RolesPresenter
  one :team, resource: TeamsPresenter
  one :user, resource: UsersPresenter
end
