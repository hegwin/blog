module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def degrade_head(html, descend_level=1)
    (1..6-descend_level).to_a.reverse.each do |head|
      html = html.gsub(/<h#{head}>/, "<h#{head+descend_level}>").gsub(/<\/h#{head}>/, "</h#{head+descend_level}>")
    end
    html
  end
end
