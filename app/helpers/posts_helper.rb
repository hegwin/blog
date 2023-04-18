module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def degrade_head(html, descend_level=1)
    (1..6-descend_level).to_a.reverse.each do |head|
      html = html.gsub(/<h#{head} /, "<h#{head+descend_level} ").gsub(/<\/h#{head}>/, "</h#{head+descend_level}>")
    end
    html
  end

  def default_meta_tags
    {
      description: "Build an interdisciplinary knowledge base on programming, math, and neuroscience.",
      keywords: 'Ruby,Ruby on Rails,CLI,Math,JavasSript,Programming,Git,PostgresQL,Rust'
    }
  end

  def meta_tags_for_post(post)
    display_meta_tags \
      keywords: post.tag_list.join(', '),
      description: [post.title_zh, post.title_en].join(', '),
      canonical: post_url(post),
      og: {
        title: post.title_en
      }
  end

  def meta_tags_for_post_list(params)
    is_with_tags  = params[:tag].present?
    is_first_page = params[:page].to_i == 1 || params[:page].blank?

    display_meta_tags \
      canonical: is_first_page ? root_url : root_url(page: params[:page]),
      noindex: is_with_tags,
      follow: true
  end

  def display_post_tags(tag_list)
    tag_list.each.with_index do |tag, i|
      css_classes = 'tag-link'
      css_classes << ' tag-link-primary' if i.zero?
      yield tag, css_classes
    end
  end

  def display_post_truncation(post)
    if I18n.locale == :en && post.body_en.present?
      (post.introduction_en.presence || post.body_en).truncate_words(60)
    else
      truncate post.introduction.presence || post.body, length: 200
    end
  end
end
