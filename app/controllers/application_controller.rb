require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    #session id set to track user
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    #don't show home page for logged in users to avoid confusion about status
    if logged_in?
      redirect to "/account/#{current_user.id}"
  
    else
      erb :welcome
    end  
  end
  
  #helper methods
  
  #track current user session
  
  def current_user
    @user = User.find_by(id: session[:user_id])
  end
   
#return boolean to check login

  def logged_in?
    !!current_user
  end

  #authorization helper for edit and delete

  def authorized(m)
    m.user == current_user
  end  


end
