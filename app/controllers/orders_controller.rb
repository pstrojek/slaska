class OrdersController < ApplicationController
  expose(:dinners)
  expose(:orders) { Order.where user: current_user }
  expose(:order)

  def index

  end

  def show
    
  end

  def new
    
  end

  def create
    if params[:form_action] == 'Add'
      return render :new
    end
    order.user = current_user

    if order.save
      redirect_to orders_path
    else
      render :new
    end
    # params[:order][:dinners]
  end

  def edit
    
  end

  def update


    if order.save
      redirect_to orders_path
    else
      render :edit
    end
  end
end