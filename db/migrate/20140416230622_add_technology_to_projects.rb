# frozen_string_literal: true
class AddTechnologyToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :technologies, :string
  end
end
