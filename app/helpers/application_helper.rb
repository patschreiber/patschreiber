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

  def twitter_url
    "https://twitter.com/patschreiber"
  end

  def github_url
    "https://github.com/patschreiber"
  end

  def linkedin_url
    "http://www.linkedin.com/pub/patrick-schreiber/2a/85/833/"
  end
end
