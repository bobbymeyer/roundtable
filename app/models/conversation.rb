# frozen_string_literal: true

class Conversation < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_uniqueness_of :title, scope: :user_id

  belongs_to :moderator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  def moderator_name
    moderator.username
  end

  def participant_list(num: 5)
    return 'No participants...' if users.empty?
    if users.count > num
      users.map(&:username).join(', ')
    else
      users.first(num).map(&:username).join(', ') + " and #{users.count - num} more..."
    end
  end
end
