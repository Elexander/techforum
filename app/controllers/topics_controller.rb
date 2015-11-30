class TopicsController < ApplicationController

	def find_topic	
		@topic  = Topic.find(params[:name])		
	end

	def index
		@topic = Topic.all
		puts "#{@topic.inspect}kjsdfiloshjiopgsjngklhnsiphviloskhjgipxhjd;ksopjv'osjm;ojm"
	end	
end
