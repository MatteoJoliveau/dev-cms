# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Admin::ApplicationController < Administrate::ApplicationController
  include Clearance::Controller

  before_action :require_login
  before_action :set_raven_context

  def set_raven_context
    Raven.user_context(email: current_user.email) if current_user.present?
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  # def records_per_page
  #   params[:per_page] || 20
  # end
end
