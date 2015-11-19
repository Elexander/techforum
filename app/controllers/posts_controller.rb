class PostsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	
	def index
		@today_posts = Post.today
  		@discussion_posts = Post.filter_by_type("Discussion")
  		@question_posts = Post.filter_by_type("Question")
  		@topic = Topic.all
  		@filter_topic = Topic.filter_by_name(params[:topic_id])
	end	


	def new
		@post = Post.new
	end	

	def show	
		@post = @post.find(params[:id])
		@post = Post.today
	end	

	
	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id
		@post.save
		if @post.save

			user = User.find(current_user.id)
			user.exp = user.exp + 1
			user.save

			if (user.badge_id == nil)
				user.badge_id = 1
				user.save
			end

			badge = Badge.last
			if (badge.id > user.badge_id)				

				badge = Badge.find(current_user.badge_id + 1)
				if (badge.exp <= user.exp)
					user.badge_id = badge.id
					user.save
				end

			end


      		redirect_to  :controller=>"comments", :action=> "index" , :post_id => @post.id
    	else
      		render :action => 'new'
    	end
	
	end	

end
