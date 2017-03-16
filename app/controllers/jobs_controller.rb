class JobsController < ApplicationController
  def index
  	@jobs=Job.all
  end

  def new
	@job=Job.new
  end

  def create
	@job=Job.create(jobs_param)
	if @job.save
		redirect_to jobs_url
	else
		render "new"
	end
  end

  def show
  	@job=Job.find_by(id: params[:id])
  end

  def destroy
	@job=Job.find(params[:id])
	@job.destroy
	redirect_to jobs_url
  end

  def edit
	@job = Job.find(params[:id])
  end

  def update
	@job = Job.find(params[:id])
	@job.update_attributes(jobs_param)
	redirect_to jobs_url
  end

private
  def jobs_param
	params.require(:job).permit(:company_id,:job_type_id,:role_id,:contact_person_id,:vacancy,:description,:salary,:address,:experience,:start_date,:end_date,:qualification,:status,:user_skills)
  end
end
