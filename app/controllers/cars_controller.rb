class CarsController < ApplicationController
  def index
      @cars = Car.all
  end
  def new
    @car = Car.new
  end
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.car_name.nil?
      @car.car_name = "その他"
    end
    @car.save!
    redirect_to cars_path, notice: '保存が成功しました'
  end
  def show
    @car = Car.find(params[:id])
    @user = User.find(@car.user_id)
  end
  def search
    maker_ids = []
    regexp = Regexp.new(".*#{params[:keyword].downcase}.*")
    Car.makers.each do |name, value|
      if name.downcase.match(regexp)
        maker_ids << value
      end
    end
    body_type_ids = []
    Car.body_types.each do |name, value|
      if name.downcase.match(regexp)
        body_type_ids << value
      end
    end
    @cars = Car.where('maker IN (?) OR body_type IN (?) OR car_name like?', maker_ids, body_type_ids, "%#{params[:keyword]}%")
    @keyword = params[:keyword]
    render "cars/index"
  end
  private
  def car_params
    params.require(:car).permit(:maker, :other_maker, :body_type, :car_name, :star, :color, :review).merge(params.permit(:car_name))
  end
end