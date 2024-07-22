# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoleMembershipsPresenter do
  context 'when just a membership' do
    let(:membership) { create(:membership) }
    let(:role) { membership.role }
    let(:team) { membership.team }
    let(:user) { membership.user }
    let(:role_with_memberships) { Role.includes(:memberships).find(role.id) }
    let(:presenter) { described_class.new(role_with_memberships) }
    let(:expected_result) do
      {
        role: {
          id: role.id,
          name: role.name,
          description: role.description,
          memberships: [
            {
              id: membership.id,
              role: {
                id: role.id,
                name: role.name,
                description: role.description
              },
              team: {
                id: team.id,
                name: team.name,
                description: team.description
              },
              user: {
                id: user.id,
                name: user.name,
                roles: user.roles.map do |role|
                  {
                    id: role.id,
                    name: role.name,
                    description: role.description
                  }
                end
              }
            }
          ]
        }
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end
end
