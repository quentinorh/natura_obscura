class Admin::SessionsController < Admin::BaseController
    skip_before_action :authenticate_admin!, only: [:new, :create]
  
    def new
    end
  
    def create
      admin = Admin.find_by(email: params[:email])
      if admin&.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_root_path, notice: 'Connecté avec succès'
      else
        flash.now[:alert] = 'Email ou mot de passe invalide'
        render :new
      end
    end
  
    def destroy
      session[:admin_id] = nil
      redirect_to root_path, notice: 'Déconnecté avec succès'
    end
  end