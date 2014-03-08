class ProjectsController < ApplicationController

  def index
  end

  def show
    @project = Project.find_by_title(params[:title].capitalize)
  end
end