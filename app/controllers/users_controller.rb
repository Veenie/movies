class UsersController < ApplicationController
  
  #render login form
  
  get '/login' do
    erb :login
  end
  
  #send parms data from login
  
  post '/login' do
    #find user
    user = User.find_by(username: params[:username])
    
    #authenticate them via a method from secure password and log in if they enter valid credentials
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
    #redirect their user page
    
      redirect to "/account/#{user.id}"
    end
   
    #failure
    
    erb :failure
  end
  
  #user account page
  
  get '/account/:id' do
    "hello"
  end
    



end  