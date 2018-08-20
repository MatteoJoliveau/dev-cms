# frozen_string_literal: true

class FeedChannel
  attr_reader :title, :link, :description, :items

  def initialize title:, link:, description:, items:
    @title = title
    @link = link
    @description = description
    @items = items
  end
end
