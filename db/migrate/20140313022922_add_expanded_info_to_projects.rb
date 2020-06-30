# frozen_string_literal: true
class AddExpandedInfoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :expanded_info, :text, :after => :slug
  end
end
