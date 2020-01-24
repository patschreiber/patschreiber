# frozen_string_literal: true

#
# The LandingPageController
# Defines the homepage functionality.
#
class LandingPageController < ApplicationController
  def index
    @blog = Blog.all
  end
end
