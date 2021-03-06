class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to profile_show_path(current_user)

        if user.profile.nil?
          redirect_to :controller => 'profile', :action => 'new'
          return
        end
      else
        flash[:error] = "Passwood incorrect"
      end
    else
      flash[:error] = "No user found with this email"
            redirect_to root_path
    end

end


  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def new

  end
end
