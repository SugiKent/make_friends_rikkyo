class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
		# @users = User.published.order("RAND()").limit(50)
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

  def edit
  end

  def update
    if @user.update(user_params)
      @user.completed = true
      @user.save
      redirect_to users_path
    else
      redirect_to edit_user_path(@user)
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :department_id, :faculty_id)
  end

end
