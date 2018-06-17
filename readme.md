-----------------------------------------------------------------------------------------------
Steps-to-setup:
------------------------------------------------------------------------------------------------
Update application.yml with your gmial creds
Update orders.rb with your mobile_number to send sms
Update order_mailer with valid emails
Update twillo.yml with proper twillo creds
Update secret.yml with your secret key

rake/rails db:migrate     #create required tables
rails db:seed             #seed demo data
rails s                   #start server
------------------------------------------------------------------------------------------------
EndPoints:

-------------------------------------------------------------------------------------------------
* Get access_token 

 Get->  http://localhost:3000/oauth/token?email=exmpale@gmail.com&password=Password&                    grant_type=password

-------------------------------------------------------------------------------------------------
* Signup (register)

  Post->  http://localhost:3000/api/user?user[email]=user@exm.com&user[password]=password
-------------------------------------------------------------------------------------------------

* Signin (login)

  Post->  http://localhost:3000/api/user/sign_in?user[email]=user@exm.com&user[password]                 =password
-------------------------------------------------------------------------------------------------

* Signout (logout)

   Delete-> http://localhost:3000/api/user/sign_out
-----------------------------------------------------------------------------------------------

* User-Profile 

   Get-> http://localhost:3000/api/v1/users/2/profile?access_token='Access Token'
-----------------------------------------------------------------------------------------------

* Add new product for signed-in user

    Post ->http://localhost:3000/api/v1/products?name=ProductName&rate=ProductRate&    access_token='Access Token'
-----------------------------------------------------------------------------------------------

* Update Product

    Patch-> http://localhost:3000/api/v1/products?id=ProductID&name=ProductName&rate=ProductRate         &user_id=UserID&access_token='Access Token'
-----------------------------------------------------------------------------------------------

* Show user's product list

    Get-> http://localhost:3000/api/v1/users/UserID/products&access_token='Access Token'
-----------------------------------------------------------------------------------------------

* Delete product

    Delete-> http://localhost:3000/api/v1/products?id=ProductID&access_token='Access Token'
-----------------------------------------------------------------------------------------------

* Add product rate

    Put-> http://localhost:3000/api/v1/products?id=2&rate=258&access_token='Access Token'

-----------------------------------------------------------------------------------------------

* Add user orders

    Post -> http://localhost:3000/api/v1/orders?user_id=UserID&access_token='Access Token'

-----------------------------------------------------------------------------------------------
* send order confirmation email and sms to User

-> triggers when add user odder is called 
-----------------------------------------------------------------------------------------------



