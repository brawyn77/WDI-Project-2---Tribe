class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

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
    @profile = Profile.new
    if current_user
      redirect_to action: 'new'
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    puts @profile.errors.full_messages.join(', ')
    # puts params[:profile]
    respond_to do |format|
      if @profile.save
        format.html { redirect_to '/profile_show', notice: 'Profile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
#   if current_user.profile.nil?
#     profile = Profile.new(profile_params)
#     profile.user = current_user
#     if profile.save
#       redirect_to root_path
#     end
#   end
#   redirect_to '/'
# end

  # PATCH/PUT /profiles/1
  def update
  #   respond_to do |format|
  #     if @profile.update(profile_params)
  #       format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
  #       # format.json { render :show, status: :ok, location: @profile }
  #     else
  #       format.html { render :edit }
  #       # format.json { render json: @profile.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  current_user.profile.update_attributes(profile_params)
  redirect_to root_path
end

  # DELETE /profiles/1
  def destroy
    # @profile.destroy
    # respond_to do |format|
    #   format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    current_user.profile.delete
    flash[:message] = "Profile successfully deleted"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Use the below definition to shorten the code parameters for several actions.
    def profile_params
      params.require(:profile).permit(:username, :address, :suburb, :postcode, :search_radius, :sex, :age, :interests, :user_id)
    end
end
