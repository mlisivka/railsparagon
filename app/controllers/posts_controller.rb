class PostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy, :show, :index]

  def index
    @posts = Post.all
  end

  def show
    @postId = Post.find(params[:id])
  end

end
