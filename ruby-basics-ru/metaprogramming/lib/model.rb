# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  class Boolean; end

  def self.included(base)
    base.extend(ClassMethods)
    base.instance_variable_set(:@attributes, {})
  end

  module ClassMethods
    def attribute(name, type: nil, default: nil)
      @attributes[name] = { default: default, type: type }
    end

    def attributes
      @attributes
    end
  end

  def initialize(*args, **kwargs)
    self.class.attributes.each do |name, attrs|
      value = attrs[:default]
      instance_variable_set("@#{name}", value)
      
      define_singleton_method(name) do
        value = instance_variable_get("@#{name}")
        type = attrs[:type]
        case type
        when :datetime
          DateTime.parse(value) unless value.nil?
        when :boolean
          !!value
        else
          value
        end
      end

      define_singleton_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end

    args.each do |arg|
      next unless arg.is_a?(Hash)
      arg.each do |name, value|
        instance_variable_set("@#{name}", value) if self.class.attributes.key?(name)
      end
    end

    kwargs.each do |name, value|
      instance_variable_set("@#{name}", value) if self.class.attributes.key?(name)
    end
  end

  def attributes
    self.class.attributes.each_with_object({}) do |(name, _), res|
      res[name] = send(name)
    end
  end
end
#END
