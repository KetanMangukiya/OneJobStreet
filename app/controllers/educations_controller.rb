class EducationsController < ApplicationController
  def new
      @education=Education.new
    end
    def index
      @educations=Education.all
    end
    def create

      @educations=current_user.educations.new(educations_param)
      if @educations.save
        #UserMailer.welcome_mail(current_user).deliver
        redirect_to educations_url
      else
        render 'new'
      end
    end

    def edit
       @education = Education.find(current_user)
    end
    def update
      @education = Education.find(current_user)
      #@user=current_user
      if @education.update(educations_param)
        UserMailer.welcome_mail(current_user).deliver_now
        redirect_to educations_path
      else
        render "edit"
      end
    end
    def destroy
      @education=Education.find(current_user)
      if @education.destroy
        redirect_to educations_url
      end
    end



    private
    def educations_param
      params.require(:education).permit(:qualification)
    end
end
