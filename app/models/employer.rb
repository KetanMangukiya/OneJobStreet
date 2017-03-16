class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
belongs_to :role
has_many :companies

def update_with_password(params={})
  if params[:current_password].blank?
    params.delete(:current_password)
    self.update_without_password(params)
  else
    self.verify_password_and_update(params)
  end
end

def update_without_password(params={})
   #params.delete(:password)
   #params.delete(:password_confirmation)
   result = update_attributes(params)
   clean_up_passwords
   result
end

 def verify_password_and_update(params)
   #devises 'update_with_password'
   # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
   current_password = params.delete(:current_password)

   if params[:password].blank?
     params.delete(:password)
     params.delete(:password_confirmation) if params[:password_confirmation].blank?
   end

   result = if valid_password?(current_password)
     update_attributes(params)
   else
     self.attributes = params
     self.valid?
     self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
     false
   end

   clean_up_passwords
   result
 end


end
