class PostsController < ApplicationController
	
	def index
		@post = Post.joins(:user).all
	end	


	def new
		@post = Post.new
	end	

	def show
		@post = Post.joins(:user).all
		@post = @post.find(params[:id])
	end	

	
	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id
		@post.save
		if @post.save
      		redirect_to  :controller=>"comments", :action=> "index" , :post_id => @post.id
    	else
      		render :action => 'new'
    	end
	
	end	

end
