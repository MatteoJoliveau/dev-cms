# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.published.starred
  end

  def about
    @content = Copy.about&.content
  end

  def contacts
    @content = Copy.contacts&.content
  end
end
