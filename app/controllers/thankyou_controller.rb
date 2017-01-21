class ThankyouController < ApplicationController
  def index
    @users_count = User.unpublished.count
  end
end
