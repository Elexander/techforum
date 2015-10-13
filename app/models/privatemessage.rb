class Privatemessage < ActiveRecord::Base
  attr_accessible :pm_content, :pm_date, :pm_subject, :usr_reciever, :usr_sender
  belongs_to :user
end
