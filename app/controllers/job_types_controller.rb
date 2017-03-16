class JobTypesController < ApplicationController
  def index
    @job_types=JobType.all
  end
  def show
    @job_type=JobType.find(params[:id])
  end
  def new
    @job_type=JobType.new
  end
  def create
    @job_type=JobType.create(job_type_params)
    if @job_type.save
      redirect_to job_types_path
    else
      render "new"
    end
  end
  def edit
    @job_type=JobType.find(params[:id])

  end
  def update
    @job_type=JobType.find(params[:id])
    if @job_type.update_attributes(job_type_params)
      redirect_to job_types_path
    else
      render "edit"
    end
  end
  def destroy
    @job_type=JobType.find(params[:id])
    if @job_type.destroy
      redirect_to job_types_path
    end
  end
  private
  def job_type_params
    params.require(:job_type).permit(:name)
  end
end
