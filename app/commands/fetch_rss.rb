# frozen_string_literal: true

require 'rss'
require "#{Rails.root}/lib/dtos/feed_channel"

class FetchRss
  prepend SimpleCommand

  CACHE = ActiveSupport::Cache::MemoryStore.new

  def initialize url
    @url = url
  end

  def call
    URI.open @url do |rss|
      @feed = RSS::Parser.parse(rss)
      cmd = MapRssItems.call @feed
      errors.add_multiple_errors cmd.errors.to_h unless cmd.success?
      map_channel @feed, cmd.result
    end
  end

  private

  def map_channel feed, items
    case feed.feed_type
    when 'rss'
      map_rss_channel feed.channel, items
    when 'atom'
      map_atom_channel feed, items
    else
      errors.add(:feed, "Unknown feed type: #{@feed.feed_type}")
    end
  end

  def map_atom_channel feed, items
    FeedChannel.new(
      title: feed.title.content,
      link: feed.link.href,
      description: feed.subtitle.content,
      items: items
    )
  end

  def map_rss_channel channel, items
    FeedChannel.new(
      title: channel.title,
      link: channel.link,
      description: channel.description,
      items: items
    )
  end
end
