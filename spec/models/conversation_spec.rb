require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:moderator) }
end
