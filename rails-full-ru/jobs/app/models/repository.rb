# frozen_string_literal: true

class Repository < ApplicationRecord
  
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  aasm column: :aasm_state do
    state :created, initial: true
    state :fetching
    state :fetched
    state :failed

    event :start_fetching do
      transitions from: :created, to: :fetching
    end

    event :mark_fetched do
      transitions from: :fetching, to: :fetched
    end

    event :mark_fetched_updated do
      transitions from: :fetched, to: :fetching
    end

    event :mark_failed do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
