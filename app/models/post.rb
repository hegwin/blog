class Post < ActiveRecord::Base
  # extends ...................................................................
  extend FriendlyId

  # validations ...............................................................
  validates :title_cn, :title_en, :body, presence: true

  # additional config .........................................................
  friendly_id :title_en, use: :slugged
end
