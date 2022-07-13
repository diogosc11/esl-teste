class ReservesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @day = DateTime.now
    @reserves = Reserve.all
    if @day.wday == 0
      @monday = @day + 1
      @tuesday = @day + 2
      @wednesday = @day + 3
      @thursday = @day + 4
      @friday = @day + 5
    end
    if @day.wday == 1
      @monday = @day
      @tuesday = @day + 1
      @wednesday = @day + 2
      @thursday = @day + 3
      @friday = @day + 4
    end
    if @day.wday == 2
      @monday = @day - 1
      @tuesday = @day
      @wednesday = @day + 1
      @thursday = @day + 2
      @friday = @day + 3
    end
    if @day.wday == 3
      @monday = @day - 2
      @tuesday = @day - 1
      @wednesday = @day
      @thursday = @day + 1
      @friday = @day + 2
    end
    if @day.wday == 4
      @monday = @day - 3
      @tuesday = @day - 2
      @wednesday = @day -1
      @thursday = @day
      @friday = @day + 1
    end
    if @day.wday == 5
      @monday = @day - 4
      @tuesday = @day - 3
      @wednesday = @day - 2
      @thursday = @day - 1
      @friday = @day
    end
    if @day.wday == 6
      @monday = @day + 2
      @tuesday = @day + 3
      @wednesday = @day + 4
      @thursday = @day + 5
      @friday = @day + 6
    end
  end

  def new
    @data = params[:data]
  end

  def create
    reserve = Reserve.create(datetime: params[:date], description: params[:description], user_id: current_user.id)
    reserve.save
  end
end
