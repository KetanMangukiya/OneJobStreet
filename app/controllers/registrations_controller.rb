class RegistrationsController < Devise::RegistrationsController



    private

      def after_sign_in_path_for(resource)
        if @userexp=current_user.hasexp
         "/experiences/new"
       else
         "/education_details/new"
       end
      end

      def update_resource(resource, params)
          resource.update_without_password(params)
        end
end
