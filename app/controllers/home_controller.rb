class HomeController < ApplicationController
  skip_before_filter :authorize_user, :only => [:index]

  def index

  end

end
