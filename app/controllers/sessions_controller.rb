class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id

        if user.profile.nil?
          redirect_to :controller => 'profile', :action => 'new'
          return
        end
      else
        flash[:error] = "Passwood incorrect"
      end
    else
      flash[:error] = "No user found with this email"
    end
      redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
