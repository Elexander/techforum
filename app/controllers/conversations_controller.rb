class ConversationsController < ApplicationController
	before_filter :authenticate_user!

  	def new
  	end

  	def create
    	recipients = User.find_by_email(params[:conversation][:recipients])
      if (recipients != nil)
        conversation = current_user.send_message(recipients, params[:conversation][:body], params[:conversation][:subject]).conversation
        flash[:success] = "Your message was successfully sent!"
        redirect_to conversation_path(conversation)
    	else
        flash.now[:notice] = "The e-mail you inserted is incorrect"
        render 'new'
      end
  	end

  	def reply
    	current_user.reply_to_conversation(conversation, params[:message][:body])
    	flash[:notice] = "Your reply message was successfully sent!"
    	redirect_to conversation_path(conversation)
  	end

  	def show
    	@receipts = conversation.receipts_for(current_user)
    	# mark conversation as read
    	conversation.mark_as_read(current_user)
  	end

  	def trash
    	conversation.move_to_trash(current_user)
    	redirect_to mailbox_inbox_path
  	end

  	def untrash
    	conversation.untrash(current_user)
    	redirect_to mailbox_inbox_path
  	end


  	private

  	def message_params
    	params.require(:message).permit(:body, :subject)
  	end

  	def conversation_params
    	params.require(:conversation).permit(:subject, :body,recipients:[])
  	end
end
