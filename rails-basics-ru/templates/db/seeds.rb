# frozen_string_literal: true

require 'faker'

5.times do |_index|
  Task.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    status: Faker::Lorem.words(number: 1).first,
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: [true, false].sample
  )
end