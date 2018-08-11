# frozen_string_literal: true

class ImageVariants
  THUMBNAIL_SIZE = Rails.configuration.image_variants['thumbnail'].freeze
  SMALL_SIZE = Rails.configuration.image_variants['small'].freeze
  SCALED_SIZE = Rails.configuration.image_variants['scaled'].freeze

  THUMBNAIL = { combine_options: {
    resize:   "#{ImageVariants::THUMBNAIL_SIZE}^",
    gravity:  'Center',
    extent:   ImageVariants::THUMBNAIL_SIZE,
    coalesce: true
  } }.freeze

  SMALL = {
    resize:   ImageVariants::SMALL_SIZE,
    coalesce: true
  }.freeze

  SCALED = {
    resize:   ImageVariants::SCALED_SIZE,
    coalesce: true
  }.freeze

  def self.each &block
    [THUMBNAIL, SMALL, SCALED].each(&block)
  end
end
