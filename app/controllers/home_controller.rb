class HomeController < ApplicationController
  def index
    @projects = Project.starred
  end
end
