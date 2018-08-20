# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.find_by_path!(params[:path]).content
    @template = Liquid::Template.parse(@page, error_mode: :warn)
    @body = @template.render(
      'projects' => projects&.map(&:to_drop), 
      'jobs' => jobs&.map(&:to_drop),
      'configs' => configs,
      'copies' => copies
      )
  end

  private

  def projects
    (@projects ||= Project.published) if @page.include? 'projects'
  end

  def jobs
    (@jobs ||= Job.published) if @page.include? 'jobs'
  end

  def copies
    return nil unless @page.include? 'copies'
    reduce_to_hash Copy.all, :name, :content
  end

  def configs
    return nil unless @page.include? 'configs'
    reduce_to_hash Config.all
  end

  def reduce_to_hash array, key_method = :key, value_method = :value
    array.reduce({}) do |acc, config| 
      acc.tap { |a| a[config.send(key_method)] = config.send(value_method) } 
    end
  end
end
