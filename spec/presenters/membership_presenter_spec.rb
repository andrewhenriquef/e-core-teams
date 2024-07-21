# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MembershipsPresenter do
  context 'when just a membership' do
    let(:membership) { create(:membership) }
    let(:role) { membership.role }
    let(:team) { membership.team }
    let(:user) { membership.user }
    let(:presenter) { described_class.new(membership) }
    let(:expected_result) do
      {
        membership: {
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
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end

  context 'when a collection of memberships' do
    let(:memberships) { create_list(:membership, 1) }
    let(:membership) { memberships.first }
    let(:role) { membership.role }
    let(:user) { membership.user }
    let(:team) { membership.team }
    let(:presenter) { described_class.new(memberships) }
    let(:expected_result) do
      {
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
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end
end
