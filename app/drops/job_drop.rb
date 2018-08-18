# frozen_string_literal: true

class JobDrop < Liquid::Drop
  def initialize job
    @job = job
  end

  def company_name
    @job.company_name
  end

  def slug
    @job.slug
  end

  def url
    @job.url
  end

  def position
    @job.position
  end

  def short_description
    @job.short_description
  end

  def description
    @job.description
  end

  def starting_date
    @job.starting_date
  end

  def ending_date
    @job.ending_date
  end

  def published?
    @job.published?
  end
end
