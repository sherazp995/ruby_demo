require "application_system_test_case"

class RepliesTest < ApplicationSystemTestCase
  setup do
    @reply = replies(:one)
  end

  test "visiting the index" do
    visit replies_url
    assert_selector "h1", text: "Replies"
  end

  test "should create reply" do
    visit replies_url
    click_on "New reply"

    fill_in "Comment", with: @reply.comment_id
    fill_in "Text", with: @reply.text
    fill_in "User", with: @reply.user_id
    click_on "Create Reply"

    assert_text "Reply was successfully created"
    click_on "Back"
  end

  test "should update Reply" do
    visit reply_url(@reply)
    click_on "Edit this reply", match: :first

    fill_in "Comment", with: @reply.comment_id
    fill_in "Text", with: @reply.text
    fill_in "User", with: @reply.user_id
    click_on "Update Reply"

    assert_text "Reply was successfully updated"
    click_on "Back"
  end

  test "should destroy Reply" do
    visit reply_url(@reply)
    click_on "Destroy this reply", match: :first

    assert_text "Reply was successfully destroyed"
  end
end
