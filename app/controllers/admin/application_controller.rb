# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin, :set_gettext_locale

    def authenticate_admin
      render_403 unless current_admin
    end

    def current_admin
      AdminUser.find_by_id(session[:admin_id])
    end

    def render_403
      render file: 'public/403.html', status: 403, layout: false
    end

    def set_gettext_locale
      requested_locale = params[:locale] || session[:locale] || cookies[:locale] ||  request.env['HTTP_ACCEPT_LANGUAGE']
      session[:locale] = FastGettext.set_locale(requested_locale)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
