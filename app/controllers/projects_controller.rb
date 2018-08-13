# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.published.by_tag params[:tag]
  end

  def show
    @project = Project.published.find params[:id]
  end
end
