module API  
    module V1
      class Users < Grape::API
        include API::V1::Defaults
        helpers Doorkeeper::Grape::Helpers
  
        resource :users do
      
          desc "Return a user"
          params do
            requires :id, type: Integer, desc: "ID of the 
              user"
          end
          get ":id/profile", root: "users" do
            doorkeeper_authorize!
            User.where(id: permitted_params[:id])
          end

          desc "Return users order"
          params do
            requires :id, type: Integer, desc: "ID of the 
              user"
          end
          get ":id/orders", root: "users" do
            doorkeeper_authorize!
            Order.where(user_id: permitted_params[:id])
          end

          desc "Return users product"
          params do
            requires :id, type: Integer, desc: "ID of the 
              user"
          end
          get ":id/products", root: "users" do
            doorkeeper_authorize!
            Product.where(user_id: permitted_params[:id])
          end

        end
        
      end

    end
  end  