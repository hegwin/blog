class Post < ApplicationRecord
  extend FriendlyId
  extend Mobility

  enum status: [:online, :offline]

  acts_as_taggable_on :tags
  translates :title, :body, :introduction

  validates :title_zh, :title_en, :body_zh, :posted_on, presence: true

  friendly_id :title_en, use: :slugged

  def sub_title(locale = I18n.locale)
    locale == :zh ? title_en : title_zh
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || created_at > 7.days.ago && title_en_changed?
  end
end
