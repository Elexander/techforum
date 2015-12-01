class TopicsController < ApplicationController

	def find_topic
		
		@topic  = Topic.find(params[:name])
	end

	def index
		#action for admin
	    if current_user.admin?
	    	@topics = Topic.all
	    end
	end
end
