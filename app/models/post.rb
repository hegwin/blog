class Post < ApplicationRecord
  extend FriendlyId

  validates :title_cn, :title_en, :body, :posted_on, presence: true

  friendly_id :title_en, use: :slugged

  private

  def should_generate_new_friendly_id?
    posted_on > 7.days.ago && title_en_changed?
  end
end
