class PrivatemessagesController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@privatemessage = Privatemessage.all

	end

	def new
		@privatemessage =	Privatemessage.new
	end

	def create
		@privatemessage = Privatemessage.new(params[:privatemessage])
		@privatemessage.save
		if @privatemessage.save
			redirect_to :action => 'show', :id => @privatemessage.id
		else
			render :action => 'new'			
		end
	end

	def show
		@privatemessage = Privatemessage.find(params[:id])
	end

	def edit
		@privatemessage = Privatemessage.find(params[:id])
	end

	def update
  		@privatemessage = Privatemessage.find(params[:id])
 
  		if @privatemessage.update(privatemessage_params)
    		redirect_to @privatemessage
  		else
    		render 'edit'
  		end
	end

	private
  	def privatemessage_params
    	params.require(:privatemessage).permit(:pm_subject, :pm_content)
  	end
end
