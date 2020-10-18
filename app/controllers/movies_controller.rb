class MoviesController < ApplicationController

#create new movie in user collection and rate it

  get '/movies/new' do
    
    erb :new
  end
end 