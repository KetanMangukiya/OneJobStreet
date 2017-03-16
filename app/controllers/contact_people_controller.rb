class ContactPeopleController < ApplicationController
  before_action :authenticate_employer!
  before_action :set_person, only: [:update, :show, :edit,:destroy]
    def set_person
      @contact_person=ContactPerson.find(params[:id])
    end
    def index
      ids=current_employer.companies.ids

      @contact_people=ContactPerson.where(company_id: current_employer.companies.ids)
    end
    def show
    end
    def new
      @contact_person=ContactPerson.new
    end
    def create

      @contact_person=ContactPerson.create(params_contact_person)
      if @contact_person.save
        redirect_to contact_people_url
      else
        render "new"
      end
    end
    def edit
    end
    def update
      if @contact_person.update_attributes(params_contact_person)
        redirect_to contact_people_url
      else
        render "edit"
      end
    end
    def destroy
      @contact_person.destroy
      redirect_to contact_people_url
    end

    private
    def params_contact_person
      params.require(:contact_person).permit(:company_id, :first_name, :last_name, :contact,:email,:role_id)
    end
end
