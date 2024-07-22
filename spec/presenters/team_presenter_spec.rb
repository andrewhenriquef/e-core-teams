# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamPresenter do
  let(:team_lead) { create(:user) }
  let(:team) { create(:team, team_lead:) }
  let!(:membership) { create(:membership, team:) }
  let(:role) { membership.role }
  let(:user) { membership.user }
  let(:presenter) { described_class.new(team) }
  let(:expected_result) do
    {
      id: team.id,
      name: team.name,
      description: team.description,
      team_lead: {
        id: team_lead.id,
        name: team_lead.name,
        roles: []
      },
      users: [
        {
          id: user.id,
          name: user.name,
          roles: [
            {
              id: role.id,
              name: role.name,
              description: role.description
            }
          ]
        }
      ]
    }.deep_stringify_keys
  end

  it { expect(presenter.serialize).to match(expected_result) }
end
