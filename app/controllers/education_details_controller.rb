class EducationDetailsController < ApplicationController
  def index
    @education_details=EducationDetail.all
  end
  def new
    @education_detail=EducationDetail.new
  end

  def create
    @education_details=current_user.education_details.new(education_details_param)
      if @education_details.save
        flash[:notice] = "Education Details save successfully..!"

        client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]
        client.account.sms.messages.create(
        from: ENV["TWILIO_PHONE_NUMBER"],
        to: "+917016230268",
        body: "hi ankita how r you ?")

#--- sms
        redirect_to education_details_url
      else
        render "new"
      end
  end

  def edit
     @education_detail=EducationDetail.find_by(user_id: current_user.id)
  end
  def update
    @education_detail = EducationDetail.find_by(id: params[:id])
    @use=current_user
    if @education_detail.update(education_details_param)

      UserMailer.welcome_email(current_user).deliver_now  # for Sending Emails

      flash[:notice] = "Education Details Update successfully..!"
      redirect_to users_url
    else

      render "edit"
    end
  end
  def destroy
    @education_detail=EducationDetail.find_by(id: params[:id])
    if @education_detail.destroy
      redirect_to education_details_url
    end
  end
  private
  def education_details_param
    params.require(:education_detail).permit(:qualification,:course,:specialization,:college,:course_type,:passing_year)
  end
end
