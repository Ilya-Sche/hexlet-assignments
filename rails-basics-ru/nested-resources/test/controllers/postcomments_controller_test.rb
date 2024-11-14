require "test_helper"

class PostcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postcomment = postcomments(:one)
  end

  test "should get index" do
    get post_postcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_post_postcomment_url
    assert_response :success
  end

  test "should create postcomment" do
    assert_difference("Postcomment.count") do
      post post_postcomments_url, params: { postcomment: { body: @postcomment.body, post_id: @postcomment.post_id } }
    end

    assert_redirected_to psot_postcomment_url(Postcomment.last)
  end

  test "should show postcomment" do
    get post_postcomment_url(@postcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_postcomment_url(@postcomment)
    assert_response :success
  end

  test "should update postcomment" do
    patch post_postcomment_url(@postcomment), params: { postcomment: { body: @postcomment.body, post_id: @postcomment.post_id } }
    assert_redirected_to post_postcomment_url(@postcomment)
  end

  test "should destroy postcomment" do
    assert_difference("Postcomment.count", -1) do
      delete post_postcomment_url(@postcomment)
    end

    assert_redirected_to post_postcomments_url
  end
end
