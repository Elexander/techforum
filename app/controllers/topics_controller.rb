class TopicsController < ApplicationController

	def find_topic
		
		@topic  = Topic.find(params[:name])
	end
end
