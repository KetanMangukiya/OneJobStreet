class IndustryTypesController < ApplicationController
  def index
  	@industry_types=IndustryType.all
  end

  def new
	@industry_type=IndustryType.new
  end

  def create
	@industry_type=IndustryType.create(industry_types_param)
	if @industry_type.valid?
		@industry_type.save
		redirect_to industry_types_url
	else
		render "new"
	end
  end

  def show
  	@industry_type=IndustryType.find_by(id: params[:id])
  end

  def destroy
	@industry_type=IndustryType.find(params[:id])
	@industry_type.destroy
	redirect_to action: :index
  end

  def edit
	@industry_type = IndustryType.find(params[:id])
  end

  def update
	@industry_type = IndustryType.find(params[:id])
	@industry_type.update_attributes(industry_types_param)
	redirect_to action: :index
  end

private
  def industry_types_param
	params.require(:industry_type).permit(:name)
  end
end
