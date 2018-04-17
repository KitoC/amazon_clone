require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get authors_index_url
    assert_response :success
  end

  test "should get books" do
    get authors_books_url
    assert_response :success
  end

end
