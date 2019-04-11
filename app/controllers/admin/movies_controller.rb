module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def update
      movie = Movie.find(params[:id])
      movie.update(user_params)
      render json: movie.attributes.to_json, status: :ok
    end  

    def user_params
      params.require(:movie).permit(
        :title,
        :description,
        :rating,
        :duration,
        :price,
        :status,
        :progress
      )
    end

  end
end

