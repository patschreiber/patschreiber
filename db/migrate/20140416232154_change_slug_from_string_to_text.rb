class ChangeSlugFromStringToText < ActiveRecord::Migration
  def change
    change_column :projects, :slug, :text
  end
end
