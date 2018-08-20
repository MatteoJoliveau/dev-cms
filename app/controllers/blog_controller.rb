# frozen_string_literal: true

class BlogController < ApplicationController
  before_action :fetch_feeds

  def index; end

  private

  def fetch_feeds
    @feeds = Config.where("key like 'rss.feed.%'").pluck(:value).map do |url|
      Rails.cache.fetch("rss.feed.#{url}", expires_in: 15.minutes) do
        cmd = FetchRss.call url
        raise ActionController::ActionControllerError, cmd.errors unless cmd.success?
        cmd.result
      end
    end
  end
end
