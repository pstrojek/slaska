class SessionsController < ApplicationController
	def new
		redirect_to '/auth/github'
	end
end
