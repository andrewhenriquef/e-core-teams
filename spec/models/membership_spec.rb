# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Membership do
  it { is_expected.to belong_to(:team) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:role) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:team_id) }
end
