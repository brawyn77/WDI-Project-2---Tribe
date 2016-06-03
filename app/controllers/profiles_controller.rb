
class ProfilesController < ApplicationController

  # GET /profiles
  def index
    if current_user && current_user.profile.nil?
      redirect_to :action => 'new'
    end
  end

  # GET /profiles/1
  def show

  end

  # GET /profiles/new
  def new
    # grabbing API
      suburbs = HTTParty.get('http://v0.postcodeapi.com.au/suburbs/3756.json')
      radius = HTTParty.get('http://v0.postcodeapi.com.au/radius.json?distance=4000&latitude=-38&longitude=145')

    # making accessible by ERB under a variable
      @suburbs = suburbs
      @radius = radius

    # extracting the options for each postcode

  end

  # GET /profiles/1/edit
  def edit
    
  end

  # POST /profiles
  def create
    @profile = Profile.create(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    session[:profile_id] = @profile.id

    # puts params[:profile]
    respond_to do |format|
      if @profile.save
        format.html { redirect_to '/profile_show', notice: 'Profile was successfully created.' }
      else
        flash[:errors] = @profile.errors.full_messages.join(', ')
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
  current_user.profile.update_attributes(profile_params)
  redirect_to root_path
  end

  # DELETE /profiles/1
  def destroy
    current_user.profile.delete
    flash[:message] = "Profile successfully deleted"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_profile
    #   @profile = Profile.find(session[:profile_id])
    # end

    # Use the below definition to shorten the code parameters for several actions.
    def profile_params
      params.require(:profile).permit(:username, :address, :suburb, :postcode, :search_radius, :sex, :age, :interests, :user_id)
    end
end
