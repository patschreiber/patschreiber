class ProjectsController < ApplicationController
  def index
    @projects = Project.where(:source_type => "open").all.order(start_date: :desc)
  end

  def show
    # The friendly_id gem will look for the slug column and match on the
    # entry for the normal entity id, so we can still use `params[:id]`.
    @project = Project.friendly.find(params[:id])
  end
end
