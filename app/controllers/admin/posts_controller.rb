module Admin
  class PostsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Post.all.paginate(10, params[:page])
    # end

    def create
      post = Post.new(post_params)
      #post.user = current_user
      if post.save
        redirect_to admin_post_path(post)
      else
        render :new
      end
    end

    def update
      post = Post.find(params[:id])
      post.update(post_params)
      if post.errors.empty?
        redirect_to admin_post_path(post)
      else
        render :edit
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Post.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    private

    def post_params
      params.require(:post).permit(:title, :content, :image, :user_id)
    end
  end
end
