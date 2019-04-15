module Admin
  class RentalsController < ApplicationController

    def index
      @rentals = Rental.all
    end

    def update
      rental = Rental.find(params[:id])
      rental.update(user_params)
      render json: rental.attributes.to_json, status: :ok
    end

    def user_params
      params.require(:rental).permit(
        :paid_price
      )
    end
  
  end
end

