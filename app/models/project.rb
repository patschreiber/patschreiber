class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged]
end
