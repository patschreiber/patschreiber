# frozen_string_literal: true
class CreateBlogTable < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :post
      t.timestamps
    end
  end
end
