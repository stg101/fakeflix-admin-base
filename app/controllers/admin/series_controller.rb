module Admin
  class SeriesController < ApplicationController
    before_action :authorize_method

    def index
      @series = Serie.all
    end

    def show
      @serie = Serie.find(params[:id])
    end

    def edit
      @serie = Serie.find(params[:id])
    end

    def update
      @serie = Serie.find(params[:id])
      @serie.update(user_params)
      render json: serie.attributes.to_json, status: :ok
    end  

    def new
      @serie = Serie.new
    end

    def create
      @serie = Serie.new(serie_params)
      @serie.save
      redirect_to admin_serie_path(@serie), notice: "The serie was successfully created"
    end

    def destroy
      serie = Serie.find(params[:id])
      serie.destroy
      redirect_to admin_series_path, notice: "The serie was successfully deleted"
    end

    def authorize_method
      authorize(Serie)
    end


    def user_params
      params.require(:serie).permit(
        :title,
        :description,
        :rating,
        :price,
        :status
      )
    end
  end
end

