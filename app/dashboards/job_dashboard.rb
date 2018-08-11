# frozen_string_literal: true

require 'administrate/base_dashboard'

class JobDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id:                Field::Number,
    company_name:      Field::String,
    position:          Field::String,
    short_description: Field::String,
    description:       Field::Ckeditor,
    image:             Field::Image,
    slug:              Field::String,
    starting_date:     Field::DateTime.with_options(format: '%d-%m-%Y'),
    ending_date:       Field::DateTime.with_options(format: '%d-%m-%Y'),
    url:               Field::String,
    created_at:        Field::DateTime,
    updated_at:        Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    company_name
    position
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    company_name
    position
    short_description
    description
    image
    starting_date
    ending_date
    url
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    company_name
    position
    short_description
    description
    image
    starting_date
    ending_date
    url
  ].freeze

  # Overwrite this method to customize how jobs are displayed
  # across all pages of the admin dashboard.
  def display_resource job
    "#{job.position} at #{job.company_name}"
  end
end
