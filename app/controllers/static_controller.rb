# frozen_string_literal: true

class StaticController < ApplicationController
  skip_before_action :authenticate_user!

  def landing_page
    return unless user_signed_in?

    redirect_to user_path(current_user)
  end
end
