# frozen_string_literal: true

# BEGIN
require 'uri'
require 'cgi'
require 'forwardable'
class Url
  extend Forwardable
  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI.parse(url)
  end

  def query_params
    return {} unless @uri.query

    CGI.parse(@uri.query).transform_keys(&:to_sym).transform_values { |v| v.size > 1 ? v : v.first }
  end

  def query_param(key, default = nil)
    query_params.fetch(key.to_sym, default)
  end

  include Comparable
  def sorted_params
    return {} unless uri.query

    params = CGI.parse(uri.query)
    sorted_params = params.map { |key, values| [key, values.first] }.to_h
    sorted_params.sort.to_h
  end

  def to_s
    uri.to_s
  end

  def ==(other)
    return false unless other.is_a?(Url)
    self.sorted_params == other.sorted_params
  end

  def <=>(other)
    return nil unless other.is_a?(Url)

    @uri.to_s <=> other.to_s
  end
end
# END

