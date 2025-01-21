require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference("Author.count") do
      post authors_url, params: { author: { birthdate: @author.birthdate, deathdate: @author.deathdate, first_name: @author.first_name, genre_id: @author.genre_id, last_name: @author.last_name, nationality: @author.nationality, patronymics: @author.patronymics } }
    end

    assert_redirected_to author_url(Author.last)
  end

  test "should show author" do
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    patch author_url(@author), params: { author: { birthdate: @author.birthdate, deathdate: @author.deathdate, first_name: @author.first_name, genre_id: @author.genre_id, last_name: @author.last_name, nationality: @author.nationality, patronymics: @author.patronymics } }
    assert_redirected_to author_url(@author)
  end

  test "should destroy author" do
    assert_difference("Author.count", -1) do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
  end
end
