class ProjectsController < ApplicationController
  def index
    @projects = Project.published
  end

  def show
    @project = Project.find(params[:id])
    pp @project
  end
end
