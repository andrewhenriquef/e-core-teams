# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  team_id    :uuid             not null
#  role_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Membership do
  describe 'associations' do
    it { is_expected.to belong_to(:team) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:team_id) }
  end

  describe 'callbacks' do
    let(:team) { create(:team) }
    let(:user) { create(:user) }
    let(:membership) { create(:membership, team:, user:, role: nil) }

    it 'sets the default role to Developer' do
      expect(membership.role.name).to eq('developer')
    end
  end
end
