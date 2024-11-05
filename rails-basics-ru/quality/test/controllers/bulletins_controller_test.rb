require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'can open all bulletins page' do
    get root_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'can open one bulletin' do
    get bulletin_path(bulletins(:bulletin_one))

    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'p', 'Bulletin 1'
    assert_select 'p', 'Body 1'
  end
end
