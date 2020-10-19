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
  
  #user account page listing their movies (Read)
  
  get '/account/:id' do
    @user = current_user
    erb :all
  end

  #sign up form

  get '/register' do
    erb :register
  end

  post '/register' do
    #create user with params entered
    @user = User.create(params)
    #login newly created user
    session[:user_id] = @user.id
    #redirect
    redirect "/account/#{@user.id}"
  end

  get '/logout' do
    #clear session cookie
    session.clear
    redirect '/' 
  end








    



end