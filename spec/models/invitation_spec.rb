# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { should belong_to(:conversation) }
  it { should belong_to(:user).optional }
end
