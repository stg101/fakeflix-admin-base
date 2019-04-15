module Admin
  class SeriesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

    def index
      @series = Serie.all
    end

    def update
      serie = Serie.find(params[:id])
      serie.update(user_params)
      render json: serie.attributes.to_json, status: :ok
    end  

    def user_params
      params.require(:series).permit(
        :title,
        :description,
        :rating,
        :price,
        :status
      )
    end
  end
end

