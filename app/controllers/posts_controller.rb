class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    if @post.errors.empty?
      redirect_to posts_path
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :autorId)
  end

end
