class ProjectsController < ApplicationController
  def index
    @projects = Project.published
  end

  def show
    @project = Project.published.find params[:id]
  end
end
