class SkillsController < ApplicationController
  def index
    @skills=Skill.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
    format.html
    format.json { render :json => @skills.map(&:attributes) }
  end
  end
  def show
       @skills=Skill.where("name like ?", "%#{params[:q]}%")
      respond_to do |format|
      format.html
      format.json { render :json => @skills.map(&:attributes) }
    end
  end
  def new
    @skill=Skill.new
  end
  def create
    @skill=Skill.create(skill_params)
  end
  private
  def skill_params
    params.require(:skill).permit(:name)
  end
end
