class OrdersController < ApplicationController
  expose(:dinners)
  expose(:orders)
  expose(:order)

  def index
    
  end

  def show
    
  end

  def new
    
  end

  def create
    if order.save
      redirect_to orders_path
    else
      render :new
    end
    # params[:order][:dinners]
  end

  def edit
    
  end
end