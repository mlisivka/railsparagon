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
  
  private
  
  def token(code)
    path = "https://developer-paragon.epicgames.com/v1/auth/token/#{code}"
    data = epic_request(path)
    user = User.find_by_accountId(data["accountId"])
    if user.nil?
      name = get_name(data["accountId"])
      user = User.create(accountId: data["accountId"], name: name)
    end
    log_in(user)
    redirect_to after_sign_in_path_for
  end
  
  def get_name(accountId)
    epic_request("https://developer-paragon.epicgames.com/v1/account/#{accountId}")["displayName"]
  end
  
  def epic_request(path)
    uri = URI.parse(path)
    request = Net::HTTP::Get.new(uri)
    request.add_field("Accept", "application/json; charset=utf-8")
    request.add_field("X-Epic-ApiKey", ENV["API_KEY"])
    request.add_field("Authorization", ENV["AURHORIZATION"])
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(request)
    return JSON.parse response.body
  end
  
end
