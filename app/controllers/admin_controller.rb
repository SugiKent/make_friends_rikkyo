class AdminController < ApplicationController
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == ENV["HALCALA_BASIC_NAME"] && pass == ENV["HALCALA_BASIC_PASSWORD"]
    end
  end


end
