require 'doorkeeper/grape/helpers'

module API  
    module V1
      class Products < Grape::API
        helpers Doorkeeper::Grape::Helpers
        include API::V1::Defaults
        
        resource :products do
          desc "Return all products"
          get "", root: :products do
              #Authorize with DoorKeeper
            doorkeeper_authorize!
            Product.all
          end
  
          desc "Return a product"
          params do
            requires :id, type: String, desc: "ID of the 
            products"
          end
          get ":id", root: "products" do
            doorkeeper_authorize!
            Product.where(id: permitted_params[:id]).first!
          end
          
          
          desc "Creates  a new product"
          params do
            requires :name, type: String, desc: "Name of the 
            products"
            requires :rate, type: Integer, desc: "Rate of the 
            products"
          end
          post do
            doorkeeper_authorize!
            Product.create(name: permitted_params[:name],rate: permitted_params[:rate])
          end         
         
          desc "Update product"
          params do
            requires :id, type: Integer, desc: "ID of the 
            products"
            requires :name, type: String, desc: "New Name of the 
            products"
            requires :rate, type: String, desc: "New Rate of the 
            products"
            optional :user_id, type: String, desc: "User Id"
          end
          patch do
            doorkeeper_authorize!
            product = Product.find(permitted_params[:id])
            product.update(name: permitted_params[:name],rate: permitted_params[:rate],user_id: permitted_params[:user_id])
          end     
          

          desc "Delete specic product"
          params do
            requires :id, type: Integer, desc: "ID of the 
            products"
          end
          delete do
            doorkeeper_authorize!
            Product.destroy(permitted_params[:id])
          end   

          desc "Add product rate"
          params do
            requires :id, type: Integer, desc: "ID of the 
            products"
            requires :rate, type: String, desc: "New Name of the 
            products"
          end
          put do
            doorkeeper_authorize!
            product = Product.find(permitted_params[:id])
            product.update(rate: permitted_params[:rate])
          end  

        end
        
      end

    end
  end  
  