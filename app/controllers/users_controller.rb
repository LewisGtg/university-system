class UsersController < ApplicationController
  before_action :require_admin, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all.order(:name)
  end
  
  def show
    redirect_to root_path, alert: 'Access denied.' unless current_user == @user || admin?
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to users_path, notice: 'User created successfully!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated successfully!'
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User deleted successfully!'
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :phone, :academic_record, :password, :password_confirmation, :role)
  end
end