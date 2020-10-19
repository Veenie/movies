class UsersController < ApplicationController
  
  #render login form
  
  get '/login' do
    #this is where you put a pry to check flash message because it redirects here
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
   
    #failure, flash message must be paired with redirect, will show up when sent to page
    flash[:error] = "Oops, looks like you entered in something wrong, try again!"
    redirect '/login'
    
  end
  
  #user account page listing their movies (Read)
  
  get '/account/:id' do
    @user = current_user
    erb :account
  end

  #sign up form

  get '/register' do
    erb :register
  end

  post '/register' do
    #create user with params entered
    @user = User.create(params)
    if @user.save
    #login newly created user
    session[:user_id] = @user.id
    #redirect
    redirect "/account/#{@user.id}"
    end
    #Input error handling
    flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
    redirect '/register'
  end

  get '/logout' do
    #clear session cookie
    session.clear
    redirect '/' 
  end








    



end