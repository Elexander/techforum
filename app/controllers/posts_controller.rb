class PostsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	
	def index
		@today_posts = Post.today
		if (params[:topic_id] == nil)
  			@discussion_posts = Post.filter_by_type("Discussion")
  		else
  			@discussion_posts = Post.filter_by_topic(params[:topic_id]).filter_by_type("Discussion")
  		end
  		if (params[:topic_id] == nil)
  			@question_posts = Post.filter_by_type("Question")
  		else
  			@question_posts = Post.filter_by_topic(params[:topic_id]).filter_by_type("Question")
  		end
  		@topic = Topic.all
  		@filter_topic = Topic.filter_by_name(params[:topic_id])
	end

	def myposts
		@my_posts = Post.filter_by_owner(current_user.id)
	end

	def questionswindow
		if (params[:topic_id] == nil)
			@question_posts = Post.filter_all_by_type("Question")
		else
			@question_posts = Post.filter_by_topic(params[:topic_id]).filter_all_by_type("Question")
		end
		@topic = Topic.all
	end

	def discussionswindow
		if (params[:topic_id] == nil)
			@discussion_posts = Post.filter_all_by_type("Discussion")
		else
			@discussion_posts = Post.filter_by_topic(params[:topic_id]).filter_all_by_type("Discussion")
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
			topic_id = topic.main_topic_id
		else
			topic_id = topic.id
		end

		if (topic == nil)
			topic = Topic.new
			topic.name = @topic_name
			topic.save
			topic  = Topic.find_by_name(@topic_name)
			topic_id = topic.id				
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

	def search

		search_text = params[:search]

		if (search_text != nil)
			search_find = Post.search{fulltext search_text}
			@search_result = search_find.results
		else
				@search_result = Post.all
		end

	end

end
