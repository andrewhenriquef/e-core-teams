# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamsPresenter do
  let(:teams) { build_stubbed_list(:team, 1) }
  let(:team) { teams.first }
  let(:presenter) { described_class.new(teams) }
  let(:expected_result) do
    {
      teams: [
        {
          id: team.id,
          name: team.name,
          description: team.description
        }
      ]
    }.deep_stringify_keys
  end

  it { expect(presenter.serialize).to match(expected_result) }
end
