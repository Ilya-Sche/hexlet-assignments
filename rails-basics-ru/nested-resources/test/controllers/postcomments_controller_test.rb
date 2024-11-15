# require "test_helper"

class PostcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one) # создаем пост, к которому будет привязан комментарий
    @postcomment = @post.postcomments.first # используем первый комментарий этого поста
  end

  test 'should get index' do
    get post_postcomments_url(@post)
    assert_response :success
  end

  test 'should get new' do
    get new_post_postcomment_url(@post)
    assert_response :success
  end

  test 'should create postcomment' do
    assert_difference('Postcomment.count') do
      post post_postcomments_url(@post), params: { postcomment: { body: 'New Comment', post_id: @post.id } }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should get edit' do
    get edit_post_postcomment_url(@post, @postcomment)
    assert_response :success
  end

  test 'should update postcomment' do
    patch post_postcomment_url(@post, @postcomment),
          params: { postcomment: { body: 'Updated Comment', post_id: @post.id } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy postcomment' do
    assert_difference('Postcomment.count', -1) do
      delete post_postcomment_url(@post, @postcomment)
    end

    assert_redirected_to post_url(@post)
  end
end
