class EmployersController < ApplicationController
before_action :authenticate_employer!
=begin
  def index
    @employers=Employer.all

  end
  def new
    @employer=Employer.new
  end
  def create
    @employer=Employer.create(employer_params)
    if @employer.save
      redirect_to new_company_path(@employer)
    else
      render "new"
    end
  end

 def destroy
     @employer=Employer.find(params[:id])
     if @employer.destroy
       redirect_to employers_path
     end
 end
 private
 def employer_params
   params.require(:employer).permit(:first_name,:last_name,:email,:password,:contact,:company_name,:role_id)
 end
=end
  def edit
    @employer=current_employer

  end
  def update_password
    @employer=Employer.find(current_employer.id)
    if @employer.update_with_password(employer_params)

      redirect_to root_path,notice: t('devise.passwords.updated')
      bypass_sign_in(@employer)

    else
      render "edit"
    end
  end


  private
  def employer_params
    params.require(:employer).permit(:password,:current_password,:password_confirmation)
  end
end
