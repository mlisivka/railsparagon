module Admin
  class MatchesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Match.all.paginate(10, params[:page])
    # end

    def create
      super
      resource = resource_class.last
      resource.update(password: random_pass) if resource.password.empty?
    end

    def random_pass
      File.readlines("#{Rails.root}/lib/password.txt").sample.strip+(rand(9000)+1000).to_s()
    end

    # Define a custom finder by overriding the `find_resource` method:
    #def find_resource(param)
    #  Match.find_by!(slug: param)
    #end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
