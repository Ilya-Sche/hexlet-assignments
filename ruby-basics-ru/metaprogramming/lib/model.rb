# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  def initialize(attributes)
    @attributes = attributes
  end

  def attribute(name, type: nil)
    value = instance_variable_get("@#{name}")
    return value if type.nil?

    type.parse(value)
  end
end

class Post
  include Model

  def initialize()
    kwargs.each do |attribute_name, attribute_value|
      instance_variable_set "@#{attribute_name}", attribute_value
      self.class.define_method attribute_name do
        instance_variable_get("@#{attribute_name}")
      end
      self.class.define_method "#{attribute_name}=" do |value|
        instance_variable_set "@#{attribute_name}", value
      end
    end
  end
end
# END