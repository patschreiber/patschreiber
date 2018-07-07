class AddImageUrlToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :img_url, :string, :after => :repo_url
  end
end
