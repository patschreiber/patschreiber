# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.patschreiber.com'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # group(:sitemaps_path => 'en/', :)
  add '/contact', changefreq: :daily, priority: 0.9
  add '/open-source', changefreq: :weekly, priority: 0.8

  # Load all Project routes into the sitemap
  Project.find_each do |project|
    add open_source_project_path(project),
      lastmod: project.updated_at,
      priority: 0.8
  end

  add '/privacy-policy', changefreq: :weekly, priority: 0.8

  add '/resume', changefreq: :daily, priority: 0.7
end
