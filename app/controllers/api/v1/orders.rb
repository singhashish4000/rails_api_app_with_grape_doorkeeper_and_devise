module API  
    module V1
      class Orders < Grape::API
        include API::V1::Defaults
        helpers Doorkeeper::Grape::Helpers
        resource :orders do

          desc "Creates a new Order"
          params do
            requires :user_id, type: Integer, desc: "id of the 
            users"
          end
          post do
          #Authorize with DoorKeeper
          doorkeeper_authorize!
           @order = Order.create(user_id: permitted_params[:user_id])
          end
          #Send SMS
          # # Instantiate a Twilio client
          # client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
          # # Create and send an SMS message
          # client.api.account.messages.create(
          #   from: TWILIO_CONFIG['from'],
          #   to: 'Your mobile number goes here',
          #   body: "Your Order is confirmed"
          # )

          # #Send Email
          # mail = OrderMailer.order_confirm_email
          # mail.deliver_now
        end
        
      end

    end
  
  end 