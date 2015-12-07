class UsersController < ApplicationController

	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name << :last_name
      devise_parameter_sanitizer.for(:account_update) << :name <<:image << :last_name
      end
    

    def check_email
    	@user = User.find_by_email(params[:email])

    	respond_to do |format|
    		format.json { render :json => !@user }
    	end
    end

    
end
