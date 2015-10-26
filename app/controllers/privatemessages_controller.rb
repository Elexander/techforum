class PrivatemessagesController < ApplicationController
	before_filter :authenticate_user!
	
 	def new
  	end

  	def create
  		THIS IS USELESS!
  		current_user.send_message(beta, "Body", "subject")
  	end
end
