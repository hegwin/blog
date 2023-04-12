class RenameCnColumnsToZh < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :title_cn, :title_zh
    rename_column :posts, :introduction_cn, :introduction_zh
    rename_column :posts, :body, :body_zh
    add_column    :posts, :body_en, :text
  end
end
