class PostsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	
	def index
		@today_posts = Post.today
  		@discussion_posts = Post.filter_by_type("Discussion")
  		@question_posts = Post.filter_by_type("Question")
  		@topic = Topic.all
  		@filter_topic = Topic.filter_by_name(params[:topic_id])
	end

	def myposts
		@my_posts = Post.filter_by_owner(current_user.id)
	end

	def questionswindow
		@questi_posts = Post.filter_by_type("Question")
		if (params[:topic_id] == nil)
			@question_posts = @questi_posts
		else
			@question_posts = Post.filter_by_topic(params[:topic_id]).filter_by_type(params["Question"])
		end
		@topic = Topic.all
	end

	def discussionswindow
		@discu_posts = Post.filter_by_type("Discussion")
		if (params[:topic_id] == nil)
			@discussion_posts = @discu_posts
		else
			@discussion_posts = Post.filter_by_topic(params[:topic_id]).filter_by_type(params["Discussion"])
		end
		@topic = Topic.all
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


		@topic_name = params[:topic_name][:topic_name]
		@topic_name = @topic_name.upcase
		topic  = Topic.find_by_name(@topic_name)
		

		if (topic == nil)
			topic = Dicctionarytopic.find_by_secondary_name(@topic_name)
		else
			topic_id = topic.id
		end

		if (topic == nil)
			topic = Topic.new
			topic.name = @topic_name
			topic.save
			topic  = Topic.find_by_name(@topic_name)
			topic_id = topic.id

		else
			topic_id = topic.main_topic_id
		end

		@post.topic_id = topic_id



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

	def find_topic
		@topic_name = params[:name]
		@topic  = Topic.find(params[@topic_name])
	end

end
