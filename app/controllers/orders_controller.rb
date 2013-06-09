class OrdersController < ApplicationController
  before_filter :autorization_admin_or_owner, :only => [:edit, :update]
  expose(:dinners)
  expose(:orders) { Order.where user: current_user }
  expose(:order)

  def index
  end

  def show
    self.order.dinners.new
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
  end

  def edit
  end

  def update
    order.dinner_ids = params[:order][:dinner_ids].values
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
