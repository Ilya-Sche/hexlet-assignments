# frozen_string_literal: true

require 'faker'

5.times do |_index|
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    summary: Faker::Lorem.words(number: 1).first,
    published: [true, false].sample
  )
end