class CreatePostcomments < ActiveRecord::Migration[7.2]
  def change
    create_table :postcomments do |t|
      t.text :body
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
