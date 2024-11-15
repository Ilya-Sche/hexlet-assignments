# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :postcomments

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end
