class MoviesController < ApplicationController

#render form to create new movie in user collection and rate it

  get '/movies/new' do
    erb :new
  end

  post '/movies/new' do
    
    #recieve params from 'new' form, create used to save
    movie = Movie.new(title: params[:title], rating: params[:rating], user_id: current_user.id)
    
    #If inputs valid it will save, so we control outcomes here
    if movie.save
      
      redirect to "/"
    else
        flash[:error] = "Error: #{movie.errors.full_messages.to_sentence}"
        redirect '/movies/new'

    end
    
  end

  #edit action through movie's individual page, render form
  
  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    erb :edit
    
  end

  #RackMethodOveride enabled in config, so we can use patch to edit with new params

  patch '/movies/:id' do
    
    @movie = Movie.find(params[:id])
    @movie.update(title: params[:title], rating: params[:rating])
    redirect '/'
  end
  
  #delete button

  delete '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect '/'
  end



end