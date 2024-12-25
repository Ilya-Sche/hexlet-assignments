# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    cache_key = "article_last_reading_date"

    Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Time.current
    end
  end
  # END
end
