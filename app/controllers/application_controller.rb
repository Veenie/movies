require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    #session id set to track user
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    #don't show home page for logged in users to avoid confusion about status
    if is_logged_in?
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

  def is_logged_in?
    !!current_user
  end

end
