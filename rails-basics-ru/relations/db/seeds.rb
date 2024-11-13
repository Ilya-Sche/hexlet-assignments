# frozen_string_literal: true

require 'faker'

5.times do |_index|
  Task.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
