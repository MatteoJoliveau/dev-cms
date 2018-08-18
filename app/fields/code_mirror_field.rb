# frozen_string_literal: true

require 'administrate/field/base'

class CodeMirrorField < Administrate::Field::Base
  def to_s
    data
  end

  def mode
    (options[:mode] || 'javascript').to_s
  end
end
