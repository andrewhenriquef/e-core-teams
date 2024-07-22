# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Role do
  it { is_expected.to have_many(:memberships) }
  it { is_expected.to have_many(:users).through(:memberships) }

  it { is_expected.to validate_presence_of(:name) }
end
