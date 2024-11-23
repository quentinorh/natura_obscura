module AdminAuthentication
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_admin!
      helper_method :current_admin
    end
  
    private
  
    def authenticate_admin!
      unless current_admin
        redirect_to admin_login_path, alert: 'Veuillez vous connecter'
      end
    end
  
    def current_admin
      @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
    end
  end