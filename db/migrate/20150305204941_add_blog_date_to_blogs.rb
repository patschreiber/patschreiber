class AddBlogDateToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :initial_posting, :datetime, :after => :post
  end
end
