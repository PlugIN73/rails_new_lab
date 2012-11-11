class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :published_at
      t.string :title
      t.string :description
      t.text :body
      t.string :state

      t.timestamps
    end
  end
end
