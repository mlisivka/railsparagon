class PostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy, :show, :index]

  def index
    @posts = Post.all
  end

  def show
    @postId = Post.find(params[:id])
  end

  def edit
  end

  def create
    user = User.find(current_user)
    @post = user.posts.create(post_params)
    if @post.errors.empty?
      redirect_to posts_path
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
