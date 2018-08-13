# frozen_string_literal: true

module SitemapHelper
  def home_last_modified
    [
        project_last_modified,
        job_last_modified,
        copy_last_modified
    ].max
  end

  def project_last_modified
    model_last_modified Project
  end

  def job_last_modified
    model_last_modified Job
  end

  def copy_last_modified
    model_last_modified Copy
  end

  def about_last_modified
    Copy.about.updated_at
  end

  def contacts_last_modified
    Copy.contacts.updated_at
  end

  def iso_date date
    date.iso8601
  end

  private

  def model_last_modified model
    model.order(:updated_at).pluck(:updated_at).last
  end
end
