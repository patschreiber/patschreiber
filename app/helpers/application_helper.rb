module ApplicationHelper

  def current_year
    DateTime.now.strftime("%Y")
  end

  def current_projects
    @projects = Project.order(:end_date).all
  end
end
