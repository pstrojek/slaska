class OrdersController < ApplicationController
  expose(:dinners)
  expose(:orders)
  expose(:order)

  def index
    self.orders = orders.where :user => current_user.id
  end

  def show
    
  end

  def new
    
  end

  def create
    order.user = current_user

    if order.save
      redirect_to orders_path
    else
      render :new
    end
    # params[:order][:dinners]
  end
end