# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:users).through(:memberships) }

  it { is_expected.to validate_presence_of(:name) }
end
