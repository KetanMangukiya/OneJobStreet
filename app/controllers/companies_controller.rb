class CompaniesController < ApplicationController

before_action :set_company, only: [:show, :edit, :update, :destroy]

  def set_company
    @company=Company.find(params[:id])
  end
  def index
    @companies=current_employer.companies
  end
  def show
  end
  def new
    @company=Company.new
  end
  def create
    @company=current_employer.companies.create(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render "new"
    end
  end
  def edit

  end
  def update

    if @company.update_attributes(company_params)
      redirect_to company_path(@company)
    else
      render "edit"
    end
  end
  private
  def company_params

    params.require(:company).permit(:name,:website,:industry_type_id,:description,:address,:city_id,:contact,:email,:google_plus,:facebook,:linkedin)
  end
end
