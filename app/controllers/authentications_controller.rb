class AuthenticationsController < ApplicationController
  require 'net/http'
  require 'json'
  
  def epic
    if params[:code]
      token(params[:code])
    else
      log_out
    end
  end
  
  def token(code)
    url = URI.parse("https://developer-paragon.epicgames.com/v1/auth/token/#{code}")
    
    request = Net::HTTP::Get.new(url)
    request.add_field("Accept", "application/json; charset=utf-8")
    request.add_field("X-Epic-ApiKey", ENV["API_KEY"])
    request.add_field("Authorization", ENV["AURHORIZATION"])
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = http.request(request)
    data = JSON.parse response.body
    
    user = User.find_by_accountId(data["accountId"])
    if user.nil?
      user = User.create(accountId: data["accountId"], name: "user11")
    end
    log_in(user)
    redirect_to after_sign_in_path_for
  end
  
end
