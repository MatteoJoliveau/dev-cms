# frozen_string_literal: true

require 'administrate/field/base'

class TagListField < Administrate::Field::Base
  def to_s
    data
  end

  def tag_list
    data.to_a
  end
end
