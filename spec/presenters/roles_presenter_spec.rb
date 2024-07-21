# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RolesPresenter do
  context 'when just a role' do
    let(:role) { build_stubbed(:role) }
    let(:presenter) { described_class.new(role) }
    let(:expected_result) do
      {
        role: {
          id: role.id,
          name: role.name,
          description: role.description
        }
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end

  context 'when a collection of users' do
    let(:roles) { build_stubbed_list(:role, 1) }
    let(:role) { roles.first }
    let(:presenter) { described_class.new(roles) }
    let(:expected_result) do
      {
        roles: [
          {
            id: role.id,
            name: role.name,
            description: role.description
          }
        ]
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end
end
