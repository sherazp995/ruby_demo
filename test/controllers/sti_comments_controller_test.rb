require "test_helper"

class StiCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sti_comment = sti_comments(:one)
  end

  test "should get index" do
    get sti_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_sti_comment_url
    assert_response :success
  end

  test "should create sti_comment" do
    assert_difference("StiComment.count") do
      post sti_comments_url, params: { sti_comment: { post_id: @sti_comment.post_id, text: @sti_comment.text, type: @sti_comment.type, user_id: @sti_comment.user_id } }
    end

    assert_redirected_to sti_comment_url(StiComment.last)
  end

  test "should show sti_comment" do
    get sti_comment_url(@sti_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sti_comment_url(@sti_comment)
    assert_response :success
  end

  test "should update sti_comment" do
    patch sti_comment_url(@sti_comment), params: { sti_comment: { post_id: @sti_comment.post_id, text: @sti_comment.text, type: @sti_comment.type, user_id: @sti_comment.user_id } }
    assert_redirected_to sti_comment_url(@sti_comment)
  end

  test "should destroy sti_comment" do
    assert_difference("StiComment.count", -1) do
      delete sti_comment_url(@sti_comment)
    end

    assert_redirected_to sti_comments_url
  end
end
