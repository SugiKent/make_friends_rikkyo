class UsersController < ApplicationController
  before_action :authenticate, only: :index
  before_action :check_user, only: [:edit, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @departments = Department.all
		@users = User.completed.published.order("RAND()").limit(50)
	end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to users_path
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

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      redirect_to user_path
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

  def check_user
    if "#{current_user.id}" == params[:id]
    else
      redirect_to users_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :department_id, :faculty_id, :sex, :want_friends, {:circle_ids => []})
  end

end
