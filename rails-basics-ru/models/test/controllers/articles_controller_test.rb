require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  fixtures :articles
  def setup
    @one = articles(:one)
    @two = articles(:two)
  end
  test "should get index" do
    get articles_index_url
    assert_response :success
  end

  test "should get show" do
    get articles_url(@one)
    assert_response :success
  end
end
