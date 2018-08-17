# frozen_string_literal: true

class PagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render file: 'public/404.html', status: :not_found, layout: false
  end

  def show
    @page = Page.find_by_path! params[:path]
  end
end
