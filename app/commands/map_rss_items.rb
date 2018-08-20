# frozen_string_literal: true

require "#{Rails.root}/lib/dtos/feed_item"

class MapRssItems
  prepend SimpleCommand

  def initialize feed
    @feed = feed
  end

  def call
    case @feed.feed_type
    when 'rss'
      map_rss
    when 'atom'
      map_atom
    else
      errors.add(:feed, "Unknown feed type: #{@feed.feed_type}")
    end
  end

  private

  def map_rss
    @feed.items.map do |item|
      FeedItem.new(
        title: item.title,
        author: item.author,
        link: item.link,
        content: item.description
      )
    end
  end

  def map_atom
    @feed.items.map do |item|
      FeedItem.new(
        title: item.title.content,
        author: item.author.name.content,
        link: item.link.href,
        content: item.content.content
      )
    end
  end
end
