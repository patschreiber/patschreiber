class AddTechnologyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :technologies, :string
  end
end
