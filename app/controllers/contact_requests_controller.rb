class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: [:show, :edit, :update, :destroy]

  # GET /contact_requests
  # GET /contact_requests.json
  def index
    @contact_requests = ContactRequest.all
  end

  # GET /contact_requests/1
  # GET /contact_requests/1.json
  def show
  end

  # GET /contact_requests/new
  def new
    @contact_request = ContactRequest.new
  end

  # GET /contact_requests/1/edit
  def edit
  end

  # POST /contact_requests
  # POST /contact_requests.json
  def create
    @contact_request = ContactRequest.new(contact_request_params)

    respond_to do |format|
      if @contact_request.save
        format.html { redirect_to @contact_request, notice: 'Contact request was successfully created.' }
        format.json { render :show, status: :created, location: @contact_request }
      else
        format.html { render :new }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_requests/1
  # PATCH/PUT /contact_requests/1.json
  def update
    respond_to do |format|
      if @contact_request.update(contact_request_params)
        format.html { redirect_to @contact_request, notice: 'Contact request was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_request }
      else
        format.html { render :edit }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_requests/1
  # DELETE /contact_requests/1.json
  def destroy
    @contact_request.destroy
    respond_to do |format|
      format.html { redirect_to contact_requests_url, notice: 'Contact request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_request_params
      params.fetch(:contact_request, {})
    end
end
