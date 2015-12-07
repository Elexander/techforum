class RegistrationsController < Devise::RegistrationsController
	protected

	def after_update_path_for(resource)
      posts_path
    end

	
end