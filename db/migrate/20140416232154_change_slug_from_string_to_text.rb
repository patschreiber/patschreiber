class ChangeSlugFromStringToText < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :slug, :text
  end
end
