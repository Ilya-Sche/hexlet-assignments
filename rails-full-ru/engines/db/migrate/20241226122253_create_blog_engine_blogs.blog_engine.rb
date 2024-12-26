# This migration comes from blog_engine (originally 20241226121522)
class CreateBlogEngineBlogs < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_engine_blogs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
