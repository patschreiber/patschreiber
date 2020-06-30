# frozen_string_literal: true
class ChangeSlugToSynopsis < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :slug, :synopsis
  end
end
