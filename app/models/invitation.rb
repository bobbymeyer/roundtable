# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, optional: true
  attr_accessor :user_lookup
end
