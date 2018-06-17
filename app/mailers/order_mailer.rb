
# app/mailers/order_mailer.rb
class OrderMailer < ActionMailer::Base
    default from: "Your default email goes here"
 
    def order_confirm_email
      #@user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: 'To email goes here', subject: 'Order Confirmed')
    end
end
   