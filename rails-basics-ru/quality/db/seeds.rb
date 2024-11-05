# frozen_string_literal: true

5.times do |index|
  bulletin_index = index + 1
  Bulletin.create(title: "Bulletin#{bulletin_index}", body: "Body#{bulletin_index}")
end
