# frozen_string_literal: true

class ImageValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    record.errors[attribute] << (options[:message] || "can't be blank") unless value.attached?
  end
end
