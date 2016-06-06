# The profiles controller manages the users individual profiles.
# It includes creating, showing, editing, updating and deleting profiles.
class ProfilesController < ApplicationController

  # GET /profiles
  def index
    if current_user && current_user.profile.nil?
      redirect_to :action => 'new'
    end
  end

  # GET /profiles/1
  def search
    # Finding Profile for logged in user
    @profile = Profile.find_by user_id: 'current_user.id'

    # # grabbing API
    @searcher = current_user.profile.postcode.to_s

    suburbs = HTTParty.get('http://v0.postcodeapi.com.au/suburbs/'+@searcher+'.json')
    @suburbs = suburbs
    result = @suburbs[0]['latitude']
    result2 = @suburbs[0]['longitude']

    # making accessible by ERB under a variable
      @result = result.to_s
      @result2 = result2.to_s

    @radius_current_user = current_user.profile.search_radius.to_s
    radius = HTTParty.get('http://v0.postcodeapi.com.au/radius.json?distance='+@radius_current_user+'&latitude='+@result+'&longitude='+@result2+'')

    @radius = radius
    @result3 = @radius[0]['postcode']

    @result4 = Profile.where(:postcode => @result3)

    @result5 = []
    @result4.each do |e|
      @result5.push(e.username)
    end

  end

  # GET /profiles/new
  def new

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
    redirect_to profile_show_path(current_user)
  end

  # DELETE /profiles/1
  def destroy
    current_user.profile.delete
    flash[:message] = "Profile successfully deleted"
    redirect_to user_logout_path
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
