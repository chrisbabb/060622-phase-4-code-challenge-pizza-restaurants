class RestaurantPizzasController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :this_is_invalid

    def create
        restaurant_pizza = RestaurantPizza.create!(legal_params)
        render json: restaurant_pizza.pizza, status: :created
    end

    private

    def this_is_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    def legal_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end
