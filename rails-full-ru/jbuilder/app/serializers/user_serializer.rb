class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name

  has_many :posts

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
