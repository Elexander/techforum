class PostsController < ApplicationController

	#GET /posts/index
	def index
		@post = Post.all
	end	
end
