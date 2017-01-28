class Admin::UsersController < AdminController

  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.order("created_at desc").all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'ユーザー情報をアップデートしました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :name, :department_id, :faculty_id, :completed, :published)
  end

end
