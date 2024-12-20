json.array! @users do |user|
  json.id user.id
  json.email user.email
  json.address user.address
  json.full_name "#{user.first_name} #{user.last_name}"

  json.posts user.posts.map { |post| { id: post.id, title: post.title } }
end