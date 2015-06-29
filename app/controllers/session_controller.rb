class SessionController < ApplicationController

  def create

    email = params[:email]
    password = params[:password]
    @user = User.find_by email: email
    if (@user) && (@user.authenticate password)
      render status: 201
    else
      render json: {auth: "failed"}, status: 422
    end
  end

end
