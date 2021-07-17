class CarsController < ApplicationController
  def index
      @cars = Car.all
  end

  def new
    @car = Car.new
  end
  
  def create
    # 1: other_maker が送られてきていたら(値が存在したら)その他メイカ名を保存する
    # 2: other_maker が送られてきていないならMakerとBodytypeのみ保存する
    # pursedo code
    @car = Car.new(car_params)
    if params['other_maker'].present? && params['other_body_type'].present?
    　other_maker = params['other_maker']
      car.other_maker = other_maker
      other_body_type = params['other_body_type']
      car.other_body_type = other_body_type
    elsif params['other_maker'].present?
    # 1
    　other_maker = params['other_maker']
      car.other_maker = other_maker
    elsif params['other_body_type'].present?
    　other_body_type = params['other_body_type']
      car.other_body_type = other_body_type
      # 2
      # nothing
    end
    car.save
    redirect_to users_car_path, notice: '保存が成功しました'
  end

  def edit
  end
  
  def update
  end

  def show
  end
  
#   def search
#         @cars = Car.where(["maker like?", "%#{params[:keyword]}%"]).where(["body_type like?", "%#{params[:keyword]}%"])
#         # @keyword = params[:keyword]
#         render "users/home"
# 　end
  
  private
  
  def car_params
      params.require(:cars).permit(:other_maker, :other_body_type, :car_name, :review)
  end
 
end
