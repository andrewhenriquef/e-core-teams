# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  description  :text
#  team_lead_id :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Team do
  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:users).through(:memberships) }
  it { is_expected.to have_many(:roles).through(:memberships) }
  it { is_expected.to belong_to(:team_lead).class_name('User').with_foreign_key('team_lead_id').optional(true) }

  it { is_expected.to validate_presence_of(:name) }
end
