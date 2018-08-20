# frozen_string_literal: true

class FeedItem
  attr_reader :title, :author, :link, :content

  def initialize title:, author:, link:, content:
    @title = title
    @author = author
    @link = link
    @content = content
  end
end
