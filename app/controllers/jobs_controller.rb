# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs = Job.published.order_recent
  end

  def show
    @job = Job.published.find params[:id]
  end
end
