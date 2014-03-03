class LandingPageController < ApplicationController
  
  def index
    @projects = Project.all
  end
end
