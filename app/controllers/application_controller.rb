class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # use this method to restrict users from performing actions on other accounts outside of theirs
  helper_method :user_authorized
  def user_authorized
    return current_user && @user.id == current_user.id
  end

  # GET surf HTTP request
  def surf_spot
    make_request('http://api.spitcast.com/api/county/spots/ventura/')[0]
  end

  helper_method :surf_report
  def surf_report
    make_request('http://api.spitcast.com/api/spot/forecast/' + surf_spot()['spot_id'].to_s + '/')[0]
  end

  # GET weather HTTP request
  helper_method :weather_report
  def weather_report
    make_request('http://api.openweathermap.org/data/2.5/weather?zip=93012,us&appid=' + Rails.application.credentials.weather[:key])
  end

  def make_request(url)
    req_url = URI.parse(url)
    req = Net::HTTP::Get.new(req_url.to_s)
    res = Net::HTTP.start(req_url.host, req_url.port) {|http|
      http.request(req)
    }
    JSON.parse(res.body)
  end
end
