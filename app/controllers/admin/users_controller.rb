class Admin::UsersController < ApplicationController
  before_action :load_user, only: [:destroy]
  def index
    @users = User.order(created_at: :DESC).paginate page: params[:page], per_page: 5
  end

  def destroy
    if @user.destroy
      flash[:success] = "Delete user success"
    else
      flash[:danger] = "Delete failed"
    end
    redirect_to admin_users_path
  end

  private

    def load_user
      @user = User.find_by id: params[:id]
      if @user.nil?
        flash[:danger] = "User not found"
        redirect_to admin_users_path
      end
    end
end
