# frozen_string_literal: true

module Api
  # API Base Controller
  class BaseController < ActionController::API
    # Turn on request forgery protection. Bear in mind that GET and HEAD
    # requests are not checked.
    protect_from_forgery with: :null_session

    # Always respond with JSON
    respond_to :json
  end
end
