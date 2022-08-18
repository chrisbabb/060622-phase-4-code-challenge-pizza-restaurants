class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :restaurant_not_found

    def index
        render json: Restaurant.all
    end

    def show
        render json: Restaurant.find(params[:id]), serializer: AddPizzasToRestaurantSerializer
    end

    def destroy
        Restaurant.find(params[:id]).destroy
        head :ok
    end

    private

    def restaurant_not_found
        render json: {error: "Restaurant not found"}, status: :not_found
    end

end
