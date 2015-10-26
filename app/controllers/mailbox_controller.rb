class MailboxController < ApplicationController
	before_filter :authenticate_user!

	def inbox
    	@inbox = mailbox.inbox
    	@active = :inbox
  	end

  	def sent
    	@sent = mailbox.sentbox
    	@active = :sent
 	 end

  	def trash
    	@trash = mailbox.trash
    	@active = :trash
  	end
end
