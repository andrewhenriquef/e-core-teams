# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User do
  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:teams).through(:memberships) }
  it { is_expected.to have_many(:roles).through(:memberships) }
  it { is_expected.to have_many(:led_teams).class_name('Team').with_foreign_key('team_lead_id') }

  it { is_expected.to validate_presence_of(:name) }
end
