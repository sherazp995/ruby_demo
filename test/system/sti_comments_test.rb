require "application_system_test_case"

class StiCommentsTest < ApplicationSystemTestCase
  setup do
    @sti_comment = sti_comments(:one)
  end

  test "visiting the index" do
    visit sti_comments_url
    assert_selector "h1", text: "Sti comments"
  end

  test "should create sti comment" do
    visit sti_comments_url
    click_on "New sti comment"

    fill_in "Post", with: @sti_comment.post_id
    fill_in "Text", with: @sti_comment.text
    fill_in "Type", with: @sti_comment.type
    fill_in "User", with: @sti_comment.user_id
    click_on "Create Sti comment"

    assert_text "Sti comment was successfully created"
    click_on "Back"
  end

  test "should update Sti comment" do
    visit sti_comment_url(@sti_comment)
    click_on "Edit this sti comment", match: :first

    fill_in "Post", with: @sti_comment.post_id
    fill_in "Text", with: @sti_comment.text
    fill_in "Type", with: @sti_comment.type
    fill_in "User", with: @sti_comment.user_id
    click_on "Update Sti comment"

    assert_text "Sti comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Sti comment" do
    visit sti_comment_url(@sti_comment)
    click_on "Destroy this sti comment", match: :first

    assert_text "Sti comment was successfully destroyed"
  end
end
