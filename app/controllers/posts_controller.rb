class PostsController < ApplicationController
	#GET /posts/index
	def index
		@post = Post.all
	end	


	def new
		@post = Post.new
	end	

	
	def create
		@post = Post.new(params[:post])
		@post.save
		if @post.save
      		redirect_to :action => 'index'#, :id => @robot.id
    	else
      		render :action => 'new'
    end
	
	end	

end
