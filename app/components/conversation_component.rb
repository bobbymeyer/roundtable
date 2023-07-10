# frozen_string_literal: true

class ConversationComponent < ViewComponent::Base
  def initialize(conversation:)
    super
    @conversation = conversation
  end
end
