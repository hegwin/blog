class Post < ApplicationRecord
  enum status: [:online, :offline]

  extend FriendlyId

  acts_as_taggable_on :tags

  validates :title_zh, :title_en, :body_zh, :posted_on, presence: true

  friendly_id :title_en, use: :slugged

  def main_title(locale = I18n.locale)
    locale == :zh ? title_zh : title_en
  end

  def sub_title(locale = I18n.locale)
    locale == :zh ? title_en : title_zh
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || posted_on > 7.days.ago && title_en_changed?
  end
end
