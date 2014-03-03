class AddImageUrlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :img_url, :string, :after => :repo_url
  end
end
