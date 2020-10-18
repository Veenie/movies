class MoviesController < ApplicationController

#dynamic route to user's individual movie page

  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    erb :show
  end
end 