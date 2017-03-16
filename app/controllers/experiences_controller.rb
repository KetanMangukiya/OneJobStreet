class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
      @experiences=Experience.all
    end
    def new
      @experience=Experience.new
    end
    def create
      @experience=current_user.experiences.new(users_param)

      if @experience.save

        flash[:notice] = "Record saved successfully.!"
        redirect_to new_education_detail_path
      else
          render "new"
      end
    end

    def edit
       @experience=Experience.find_by(user_id: params[:id])
    end

    def update
      @experience = Experience.find_by(id: params[:id])

      if @experience.update_attributes(users_param)
        flash[:notice] = "Record updated successfully.!"
        redirect_to users_path
      else
        render "edit"
      end
    end
    def destroy
      @experience=Experience.find_by(id: params[:id])
      if @experience.destroy
        redirect_to users_url
      end
    end
    private

    def users_param
      params.require(:experience).permit(:designation,:company,:working_since_month,:location,:notice,:working_since_year,:skills)
    end

    def set_employment
        @employeement = current_user.experiences.find(params[:id])
    end

end
