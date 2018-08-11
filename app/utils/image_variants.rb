# frozen_string_literal: true

class ImageVariants
  THUMBNAIL_SIZE = Rails.configuration.image_variants['thumbnail'].freeze
  SCALED_SIZE = Rails.configuration.image_variants['scaled'].freeze

  THUMBNAIL = { combine_options: {
    resize:   "#{ImageVariants::THUMBNAIL_SIZE}^",
    gravity:  'Center',
    extent:   ImageVariants::THUMBNAIL_SIZE,
    coalesce: true
  } }.freeze

  SCALED = {
    resize:   ImageVariants::SCALED_SIZE,
    coalesce: true
  }.freeze

  def self.each &block
    [THUMBNAIL, SCALED].each(&block)
  end
end
