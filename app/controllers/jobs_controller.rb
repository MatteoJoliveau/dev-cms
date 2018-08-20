# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs = Job.published.order_recent
  end

  def show
    @job = Job.published.find params[:id]
  end

  private

  def job_title
    @job_title ||= "#{@job.position} #{I18n.t('label.at')} #{@job.company_name}"
  end
end
