class CreateBlogPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
