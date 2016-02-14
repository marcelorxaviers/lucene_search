require 'test_helper'

class LuceneSearchesControllerTest < ActionController::TestCase
  setup do
    @lucene_search = lucene_searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lucene_searches)
  end

  test "should create lucene_search" do
    assert_difference('LuceneSearch.count') do
      post :create, lucene_search: { query: @lucene_search.query }
    end

    assert_response 201
  end

  test "should show lucene_search" do
    get :show, id: @lucene_search
    assert_response :success
  end

  test "should update lucene_search" do
    put :update, id: @lucene_search, lucene_search: { query: @lucene_search.query }
    assert_response 204
  end

  test "should destroy lucene_search" do
    assert_difference('LuceneSearch.count', -1) do
      delete :destroy, id: @lucene_search
    end

    assert_response 204
  end
end
