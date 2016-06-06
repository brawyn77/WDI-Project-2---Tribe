class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
  # If we find the user and the password matches
  if user && user.authenticate(params[:password])
    # saver the user id inside the browser cookie and log them in
    session[:user_id] = user.id
    redirect_to '/'
  else
    redirect_to profile_show_path(current_user)
  end
end
  #   if user
  #     if user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #
  #       if user.profile.nil?
  #         redirect_to :controller => 'user', :action => 'new'
  #         return
  #       end
  #     else
  #       flash[:error] = "Passwood incorrect"
  #     end
  #   else
  #     flash[:error] = "No user found with this email"
  #   end
  #     redirect_to root_path
  # end


  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def new

  end
end
