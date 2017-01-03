class UsersController < ApplicationController

before_action :load_user, only: [:show, :edit, :update]
  def show
    @followers = current_user.active_relationships.build
    @following = current_user.active_relationships.find_by(followed_id: @user.id)
    # @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).page(params[:page]).per Settings.users.per_page
  end

  def index
    @users = User.order(created_at: :desc)
      .paginate page: params[:page],per_page: 10
  end

   private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "controller.user_controller.error_norecord"
      redirect_to signup_path
    end
  end
end
