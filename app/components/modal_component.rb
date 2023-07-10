# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(title:)
    super
    @title = title
  end
end
