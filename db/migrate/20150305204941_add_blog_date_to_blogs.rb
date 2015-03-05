class AddBlogDateToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :initial_posting, :datetime, :after => :post
  end
end
