# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamPresenter do
  let(:membership) { create(:membership) }
  let(:team) { membership.team }
  let(:user) { membership.user }
  let(:role) { membership.role }
  let(:presenter) { described_class.new(team) }
  let(:expected_result) do
    {
      id: team.id,
      name: team.name,
      description: team.description,
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
