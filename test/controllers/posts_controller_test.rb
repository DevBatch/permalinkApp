require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { name: @post.name, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { name: @post.name, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
  test "should create a valid permalink(slug)" do
    post = Post.create(:name=>"test post", :title=>"My Title")
    assert_equal "my-title", post.slug
  end
  test "should create a route for show with permalink" do
    post = Post.create(:name=>"test post", :title=>"newTitle")
    path = post_path post
    assert_equal "/posts/newtitle", path
  end
  test "should create a route for update post with permalink" do
    post = Post.create(:name=>"test post", :title=>"newTitle")
    path = edit_post_path post
    assert_equal "/posts/newtitle/edit", path
  end

end
