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

  def content_meta_tags
    if request.params[:controller] =~ /^admin|^session/
      return { noindex: true, nofollow: true }
    end

    if defined?(@post)
      meta_tags_for_post(@post)
    elsif defined?(@posts)
      meta_tags_for_post_list(params)
    else
      default_meta_tags
    end
  end

  def meta_tags_for_post(post)
    {
      keywords: post.tag_list.join(', '),
      description: display_post_truncation(post),
      canonical: post_url(post, locale: I18n.locale == :en ? :en : nil),
      og: {
        title: post.title,
        description: display_post_truncation(post),
        image: post.body.match(/(?<alt>!\[[^\]]*\])\((?<filename>.*?)(?=\"|\))\)/).try(:[], :filename),
        site_name: 'Hegwin.Me',
        type: 'article',
        locale: [
          I18n.locale == :en ? 'en_US' : 'zh_CN',
          { alternate: I18n.locale == :en ? 'zh_CN' : 'en_US' }
        ]
      }.compact,
      twitter: {
        card: 'summary_large_image'
      },
      article: {
        published_time: post.posted_on.to_s(:iso8601),
        modified_time: post.updated_at.to_s(:iso8601),
        author: 'https://www.facebook.com/hegwin.wang'
      }
    }
  end

  def meta_tags_for_post_list(params)
    is_with_tags  = params[:tag].present?
    is_first_page = params[:page].to_i == 1 || params[:page].blank?
    locale = I18n.locale == :en ? :en : nil

    default_meta_tags.merge \
      canonical: is_first_page ? root_url(locale: locale) : root_url(page: params[:page], locale: locale),
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

  def link_to_alt_language
    path_params = request.params.to_h.symbolize_keys
    locale_params = { locale:  I18n.locale == :en ? nil : :en}

    if path_params[:controller] == 'posts' &&  path_params[:action] == 'index' && path_params[:tag].blank?
      root_path path_params.except(:action, :controller, :locale).merge(locale_params)
    else
      url_for path_params.merge(locale_params)
    end
  end
end
