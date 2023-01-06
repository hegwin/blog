module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def degrade_head(html, descend_level=1)
    (1..6-descend_level).to_a.reverse.each do |head|
      html = html.gsub(/<h#{head}>/, "<h#{head+descend_level}>").gsub(/<\/h#{head}>/, "</h#{head+descend_level}>")
    end
    html
  end

  def display_meta_tags_for_post(post)
    display_meta_tags \
      title: post.title_cn,
      keywords: post.tag_list.join(', '),
      description: [post.title_cn, post.title_en].join(', '),
      canonical: post_url(post, host: 'https://hegwin.me')
  end

  def display_post_tags(tag_list)
    tag_list.each.with_index do |tag, i|
      css_classes = 'tag-link'
      css_classes << ' tag-link-primary' if i.zero?
      yield tag, css_classes
    end
  end
end
