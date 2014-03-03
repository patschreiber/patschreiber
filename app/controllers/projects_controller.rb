class ProjectsController < ApplicationController

  def index
    @projects = Project.order(:end_date).all
  end
end