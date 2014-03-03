module ApplicationHelper

  def current_year
    DateTime.now.strftime("%Y")
  end
end
