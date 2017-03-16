class RolesController < ApplicationController
  def index
	@roles=Role.all
  end

  def new
	@role=Role.new
  end
  def create 
	@role=Role.create(roles_param)
	if @role.save
		redirect_to roles_url
	else
		render "new"
	end
  end

  def show
  	@role=Role.find_by(id: params[:id])
  end

  def destroy
	@role=Role.find(params[:id])
	@role.destroy
	redirect_to action: :index
  end

  def edit
	@role = Role.find(params[:id])
  end

  def update
	@role = Role.find(params[:id])
	@role.update_attributes(roles_param)
	redirect_to action: :index
  end

private
  def roles_param
	params.require(:role).permit(:name, :industry_type_id)
  end
end
