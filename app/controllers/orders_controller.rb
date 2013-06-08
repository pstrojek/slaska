class OrdersController < ApplicationController
  before_filter :autorization_admin_or_owner, :only => [:edit, :update]
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

  protected
  def autorization_admin_or_owner
    if !current_user.is_admin? && order.user != current_user
      flash[:error] = "Access Denied"
      redirect_to :action => 'index'
    end
  end
end