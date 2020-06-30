# frozen_string_literal: true
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.string :url
      t.string :repo_url
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
