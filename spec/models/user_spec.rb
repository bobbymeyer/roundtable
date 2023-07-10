require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:conversations) }
  it { should have_many(:invitations) }
  it { should have_many(:chat_messages) }
  it { should have_many(:invited_conversations).through(:invitations) }
end
