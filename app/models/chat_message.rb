# frozen_string_literal: true

class ChatMessage < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :conversation
  enum state: %i[waiting sent]

  delegate :username, to: :user, prefix: false

  after_create_commit lambda {
    broadcast_prepend_to conversation,
                         partial: 'chat_messages/chat_message',
                         locals: { chat_message: self },
                         target: 'messages'
  }
end
