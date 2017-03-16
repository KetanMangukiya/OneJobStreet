class EducationDetail < ApplicationRecord

  belongs_to :user
  after_create :send_email

   def send_email
  #  UserMailer.welcome_email(@user).deliver_now
    #UserMailer.welcome_email(current_user).deliver_now  # for Sending Emails
   end


end
