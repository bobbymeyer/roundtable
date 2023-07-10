# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :conversations

  has_many :invitations, dependent: :destroy
  has_many :invited_conversations, through: :invitations, source: :conversation
  has_many :chat_messages, dependent: :destroy
end
