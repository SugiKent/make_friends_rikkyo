class UsersController < ApplicationController

  def index
		@users = User.published.order("RANDOM()").limit(3)
	end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'user was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def departments_select
    if request.xhr?
      render partial: 'departments', locals: {faculty_id: params[:faculty_id]}
    end
  end

  def thanks
    @users_count = User.unpublished.count
  end

  private

  def user_params
    params.require(:user).permit(:name, :twitter_id, :department_id, :faculty_id)
  end

end
