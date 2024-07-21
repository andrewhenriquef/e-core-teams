# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersPresenter do
  context 'when just an user' do
    let(:membership) { create(:membership) }
    let(:user) { membership.user }
    let(:role) { membership.role }
    let(:presenter) { described_class.new(user) }
    let(:expected_result) do
      {
        user: {
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
      }.deep_stringify_keys
    end

    it { expect(presenter.serialize).to match(expected_result) }
  end

  context 'when a collection of users' do
    let(:membership) { create(:membership) }
    let(:users) { [membership.user] }
    let(:user) { users.first }
    let(:role) { user.roles.first }
    let(:presenter) { described_class.new(users) }
    let(:expected_result) do
      {
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
end
