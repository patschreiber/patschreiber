# frozen_string_literal: true
class AddTypeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :source_type, :string, after: :id
  end
end
