# frozen_string_literal: true

class ProjectDrop < Liquid::Drop
  def initialize project
    @project = project
  end

  def name
    @project.name
  end

  def slug
    @project.slug
  end

  def url
    @project.url
  end

  def website
    @project.website
  end

  def short_description
    @project.short_description
  end

  def description
    @project.description
  end

  def starred?
    @project.starred?
  end

  def published?
    @project.published?
  end

  def tags
    @project.tags
  end
end
