# frozen_string_literal: true


require_relative 'model'

class Post
  include Model
  class Boolean; end

  attribute :id, type: Integer, default: 2
  attribute :title, type: String, default: "title"
  attribute :body, type: String, default: "body"
  attribute :created_at, type: DateTime, default: Date.today.to_s
  attribute :published, type: Boolean, default: true
end
