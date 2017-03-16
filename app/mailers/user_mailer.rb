class UserMailer < ApplicationMailer
    default from: "signup.onejobstreet@gmail.com"

    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Thank you For Signup')
    end

  end
