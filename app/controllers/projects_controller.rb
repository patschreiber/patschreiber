class ProjectsController < ApplicationController
  def open_source_index
    @projects = Project.where(:source_type => "open").all
  end

  def open_source_show
    @project = Project.find_by(source_type: "open", title: params[:title])
  end
end
