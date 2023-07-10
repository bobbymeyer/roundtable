class ChatMessage < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :conversation
  enum state: [:waiting, :sent]
end
