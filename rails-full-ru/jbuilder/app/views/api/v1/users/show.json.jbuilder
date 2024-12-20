json.id @user.id
json.email @user.email
json.address @user.address
json.full_name "#{@user.first_name} #{@user.last_name}"
json.content format_content(@user.content)

json.posts @user.posts, partial: 'api/v1/posts/post', as: :post

