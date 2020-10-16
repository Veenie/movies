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
    erb :welcome
  end
  
  #helper methods
  
  #track user
  
  def current_user(session)
    @user = User.find_by_id(session[:user_id])
  end
   
#return boolean to validate login

  def is_logged_in?(session)
    !!session[:user_id]
  end

end
