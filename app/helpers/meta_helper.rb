module MetaHelper
  def meta_title title = nil
    return "#{title} | #{DEFAULT_META[:meta_title]}" if title
    content_for(:meta_title) || DEFAULT_META[:meta_title]
  end
  
  def meta_description
    content_for(:meta_description) || DEFAULT_META[:meta_description]
  end
  
  def meta_image
    meta_image = content_for(:meta_image) || DEFAULT_META[:meta_image]
    image_url meta_image
  end

  def meta_twitter
    DEFAULT_META["twitter_account"]
  end
end