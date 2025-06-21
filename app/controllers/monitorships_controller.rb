class MonitorshipsController < ApplicationController
  before_action :require_admin
  before_action :set_monitorship, only: [:show, :destroy]
  
  def index
    @monitorships = Monitorship.includes(:user, :subject).order('subjects.name')
  end
  
  def show
  end
  
  def new
    @monitorship = Monitorship.new
    @subjects = Subject.left_joins(:monitorship).where(monitorships: { id: nil })
    @students = User.student.order(:name)
  end
  
  def create
    @monitorship = Monitorship.new(monitorship_params)
    
    if @monitorship.save
      redirect_to monitorships_path, notice: 'Monitor assigned successfully!'
    else
      @subjects = Subject.left_joins(:monitorship).where(monitorships: { id: nil })
      @students = User.student.order(:name)
      render :new
    end
  end
  
  def destroy
    @monitorship.destroy
    redirect_to monitorships_path, notice: 'Monitor removed successfully!'
  end
  
  private
  
  def set_monitorship
    @monitorship = Monitorship.find(params[:id])
  end
  
  def monitorship_params
    params.require(:monitorship).permit(:user_id, :subject_id)
  end
end