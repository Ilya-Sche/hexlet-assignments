# frozen_string_literal: true

require_relative 'model'

class Post
  include Model
  class Boolean; end

  attribute :id, type: :integer, default: 2
  attribute :title, type: :string, default: "title"
  attribute :body, type: :string, default: "body"
  attribute :created_at, type: :datetime, default: Date.today.to_s
  attribute :published, type: :boolean, default: true
end
