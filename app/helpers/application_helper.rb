module ApplicationHelper

  def copyright
    "© #{DateTime.now.strftime("%Y")} Patrick Schreiber"
  end

  def current_year
    DateTime.now.strftime("%Y")
  end

  def current_projects
    @projects = Project.order(:end_date).all
  end
end
