module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def show
      @movie = Movie.find(params[:id])
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def destroy
      movie = Movie.find(params[:id])
      movie.destroy
      redirect_to admin_movies_path, notice: "The movie was successfully deleted"
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      @movie.save
      redirect_to admin_movie_path(@movie), notice: "The artist was successfully created"
    end

    def update
      movie = Movie.find(params[:id])
      movie.update(movie_params)
      render json: movie.attributes.to_json, status: :ok
    end  

    def movie_params
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

