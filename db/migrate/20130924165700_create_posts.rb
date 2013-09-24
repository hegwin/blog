class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title_cn,    index: true
      t.string :title_en,    index: true
      t.text :body
      t.datetime :posted_on, index: true
      t.string :slug,        index: true

      t.timestamps
    end
  end
end
