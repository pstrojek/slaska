class DinnersController < ApplicationController
  expose(:dinners)
  expose(:dinner)

  def index
    
  end

  def edit
    
  end

  def update
    if dinner.save
      redirect_to dinners_path
    else
      render :edit
    end
  end
end
