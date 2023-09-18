# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should belong_to(:conversation) }
  it { should define_enum_for(:state).with_values(%i[waiting sent]) }
end
