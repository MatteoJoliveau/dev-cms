# frozen_string_literal: true

class SitemapController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml do
        @projects = Project.published
        @jobs = Job.published
      end
    end
  end
end
