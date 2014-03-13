class AddExpandedInfoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :expanded_info, :text, :after => :slug
  end
end
