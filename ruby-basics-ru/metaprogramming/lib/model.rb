# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.include Virtus.model

    base.class_eval do
      attribute :id, Integer
      attribute :title, String
      attribute :body, String
      attribute :created_at, DateTime
      attribute :published, Axiom::Types::Boolean
    end
  end
end
class Post
  include Model
end
# END
