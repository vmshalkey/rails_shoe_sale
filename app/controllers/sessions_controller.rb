class SessionsController < ApplicationController
	skip_before_action :authorize

  def create
  	user = User.find_by(email: params[:email])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/shoes"
  	else
  		redirect_to "/", alert:"Invalid Username or Password"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/", alert:"Successfully logged out"
  end
end
