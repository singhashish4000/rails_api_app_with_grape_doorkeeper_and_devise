Rails.application.routes.draw do  
    
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1 do
      devise_for :user, controllers: {
           registrations: 'api/v1/user_details/registrations',
           sessions: 'api/v1/user_details/sessions'
       }, skip: [:password]
    end
  end

  use_doorkeeper
  
  mount API::Base, at: "/"
  #mount GrapeSwaggerRails::Engine, at: "/documentation"
end  