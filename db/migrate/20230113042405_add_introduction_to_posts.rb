class AddIntroductionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :introduction_cn, :text
    add_column :posts, :introduction_en, :text
  end
end
