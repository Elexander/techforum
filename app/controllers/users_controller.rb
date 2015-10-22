class UsersController < ApplicationController

	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name << :last_name
      devise_parameter_sanitizer.for(:account_update) << :name <<:image << :last_name
      end
    end
end
