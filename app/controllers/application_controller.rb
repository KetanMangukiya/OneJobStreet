class ApplicationController < ActionController::Base

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact,:company_name,:role_id,:email,:password])
   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :contact,:company_name,:role_id,:email,:password,:current_password])

   update_attrs = [:password, :password_confirmation, :current_password]
   #devise_parameter_sanitizer.permit :account_update, keys: update_attrs
 end

 def configure_devise_permitted_parameters
   permitted_params = [:first_name, :last_name, :contact,:company_name,:role_id,:email,:password,:email, :password, :password_confirmation, :name,:contactnumber,:resume,:hasexp,:city,:gender,:date_of_birth,:address,:pincode,:marital_status]

   if params[:action] == 'update'
     devise_parameter_sanitizer.permit(:account_update) {
       |u| u.permit(permitted_params << :current_password)
     }
   elsif params[:action] == 'create'

     devise_parameter_sanitizer.permit(:sign_up) {
       |u| u.permit(permitted_params)
     }
   end
 end
end
