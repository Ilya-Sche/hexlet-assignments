require 'application_system_test_case'

class PostcommentsTest < ApplicationSystemTestCase
  setup do
    @postcomment = postcomments(:one)
  end

  test 'visiting the index' do
    visit postcomments_url
    assert_selector 'h1', text: 'Postcomments'
  end

  test 'should create postcomment' do
    visit postcomments_url
    click_on 'New postcomment'

    fill_in 'Body', with: @postcomment.body
    fill_in 'Post', with: @postcomment.post_id
    click_on 'Create Postcomment'

    assert_text 'Postcomment was successfully created'
    click_on 'Back'
  end

  test 'should update Postcomment' do
    visit postcomment_url(@postcomment)
    click_on 'Edit this postcomment', match: :first

    fill_in 'Body', with: @postcomment.body
    fill_in 'Post', with: @postcomment.post_id
    click_on 'Update Postcomment'

    assert_text 'Postcomment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Postcomment' do
    visit postcomment_url(@postcomment)
    click_on 'Destroy this postcomment', match: :first

    assert_text 'Postcomment was successfully destroyed'
  end
end
