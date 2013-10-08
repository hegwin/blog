class Post < ActiveRecord::Base
  attr_accessible :body, :posted_on, :slug, :title_cn, :title_en

  validates :title_cn, :title_en, :body, presence: true
end
