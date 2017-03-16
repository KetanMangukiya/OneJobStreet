Rails.application.routes.draw do


  devise_for :employers, controllers: { application: 'application' }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resource :employers, only: [:edit] do
      collection do
        patch 'update_password'
      end
    end

    root 'employers#home'
    resources :employers
    resources :companies
    resources :jobs
    resources :contact_people
    resources :industry_types
    resources :job_types
    resources :roles
    resources :cities

  resources :experiences
  resources :educations
  resources :education_details
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "users#home"
  resource :skills
  resources :locations
  resources :education_details
  resources :educations
  
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end
#post "/users/password" => "devise/passwords#create" ,as: "changepassword"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
