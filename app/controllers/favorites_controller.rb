class FavoritesController < ApplicationController
    def create
        @car = Car.find(params[:format])
        favorite = current_user.favorites.new(car_id: @car.id)
        favorite.save
        redirect_to car_path(@car)
    end
    def destroy
        @car = Car.find(params[:id])
        favorite = current_user.favorites.find_by(car_id: @car.id)
        favorite.destroy
        redirect_to car_path(@car)
    end
end
