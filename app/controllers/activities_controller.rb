class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :check_user_auth, only: [:edit, :update, :destroy]

  # HTTP library that we use
  require 'net/http'

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all

    # GET surf HTTP request
    surf_url = URI.parse('http://api.spitcast.com/api/county/spots/orange-county/')
    surf_req = Net::HTTP::Get.new(surf_url.to_s)
    surf_res = Net::HTTP.start(surf_url.host, surf_url.port) {|http|
      http.request(surf_req)
    }
    @surf_report = JSON.parse(surf_res.body)


    

    # GET weather HTTP request
    weather_url = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Los+Angeles&appid=' + Rails.application.credentials.weather[:key])
    weather_req = Net::HTTP::Get.new(weather_url.to_s)
    weather_res = Net::HTTP.start(weather_url.host, weather_url.port) {|http|
      http.request(weather_req)
    }
    @weather_report = JSON.parse(weather_res.body)

  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    if current_user.nil?
      redirect_to :login, notice: "You must be logged in to create an event"
    end

    @event_types = EventType.all
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = current_user.id

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def check_user_auth
      unless current_user && @activity.user_id == current_user.id
        redirect_to root_url, notice: "You can't make changes to someone else's data"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :description, :start_time, :end_time, :image, :event_type_id)
    end
end
