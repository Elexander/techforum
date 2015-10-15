class PostsController < ApplicationController
	#GET /posts/index
	def index
		@post = Post.all
	end	


	def new
		@post = Post.new
	end	

	def show
		@post = Post.find(params[:id])
	end	

	
	def create
		@post = Post.new(params[:post])
		@post.save
		if @post.save
      		redirect_to  :controller=>"comments", :action=> "index" , :post_id => @post.id
    	else
      		render :action => 'new'
    	end
	
	end	

end
