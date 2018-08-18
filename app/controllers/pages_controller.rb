# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.find_by_path!(params[:path]).content
    @template = Liquid::Template.parse(@page, error_mode: :warn)
    @body = @template.render('projects' => projects&.map(&:to_drop), 'jobs' => jobs&.map(&:to_drop))
  end

  private

  def projects
    (@projects ||= Project.published) if @page.include? 'projects'
  end

  def jobs
    (@jobs ||= Job.published) if @page.include? 'jobs'
  end
end
