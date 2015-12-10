class TopicsController < ApplicationController
before_filter :authenticate_user!, :except => [:find_topic, :index]

	def find_topic	
		@topic  = Topic.find(params[:name])		
	end	

	def index
		@topic = Topic.all
	end	

	def admin_editor
			
		@selected_topic = params[:from]
		@destination_topic = params[:to_sub_topic]

		if(@selected_topic != @destination_topic)

			sub_topic = Dicctionarytopic.new
			topic_select = Topic.find(@selected_topic)
			topic_to = Topic.find(@destination_topic)

			sub_topic.secondary_name = topic_select.name
			sub_topic.main_topic_id = topic_to.id
			sub_topic.save

			Post.where('topic_id = ?', @selected_topic).update_all(topic_id: @destination_topic)

			Topic.delete(topic_select.id) 
			flash[:notices] = "Topic successfully updated"

		else
			#flash[:notices] = "Topic to be moved and destination topic cannot be the same"			
		end
	end

#	def admin_editors #testing parameters, ignore this code
#		@selected_topic = params[:from]
#		@destination_topic = params[:to_sub_topic]
#		
#	end

	def admin_new
		@topic = Topic.new
		#@topic.name = params[:new_topic] #Topic textbox for new topic
		@topic.save
	end

	def test
		@selected_topic = params[:from]
		logger.debug "New post: #{@selected_topic.attributes.inspect}"
		
	end
	
end
