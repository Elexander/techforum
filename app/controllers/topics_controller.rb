class TopicsController < ApplicationController

	def find_topic
<<<<<<< HEAD
		@topic  = Topic.find(params[:name])
=======
		
		@topic  = Topic.find(params[:name])
		
>>>>>>> 83255b92e07f59247fb15324649720fb1e732f74
	end
end
