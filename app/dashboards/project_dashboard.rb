# frozen_string_literal: true

require 'administrate/base_dashboard'

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id:                Field::Number,
    name:              Field::String,
    slug:              Field::String,
    url:               Field::String,
    website:           Field::String,
    short_description: Field::String,
    description:       Field::Ckeditor,
    star:              Field::Boolean,
    published:         Field::Boolean,
    image:             Field::Image,
    tag_list:          TagListField,
    created_at:        Field::DateTime,
    updated_at:        Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    short_description
    star
    published
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    short_description
    description
    tag_list
    image
    url
    website
    star
    published
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    short_description
    description
    tag_list
    image
    url
    website
    star
    published
  ].freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  def display_resource project
    project.name
  end
end
