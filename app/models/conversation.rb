# frozen_string_literal: true

class Conversation < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title
  validates_uniqueness_of :title

  belongs_to :moderator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
  has_many :chat_messages, dependent: :destroy

  delegate :username, to: :moderator, prefix: true
end
