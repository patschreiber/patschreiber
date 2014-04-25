class LandingPageController < ApplicationController
  
  def index
    @blog = Blog.all
  end
end
