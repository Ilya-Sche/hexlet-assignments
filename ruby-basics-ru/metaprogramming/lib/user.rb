# frozen_string_literal: true


class User
  include Model

  attribute :name, type: :string, default: 'Andrey'
  attribute :birthday, type: :datetime
  attribute :active, type: :boolean, default: false
end
