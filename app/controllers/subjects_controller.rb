class SubjectsController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :enroll, :unenroll]
  
  def index
    @subjects = Subject.all.order(:name)
  end
  
  def show
    @students = @subject.students
    @monitor = @subject.monitor
    @available_students = User.student.where.not(id: @students.pluck(:id)).order(:name)
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(subject_params)
    
    if @subject.save
      redirect_to subjects_path, notice: 'Subject created successfully!'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject updated successfully!'
    else
      render :edit
    end
  end
  
  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: 'Subject deleted successfully!'
  end
  
  def enroll
    student = User.find(params[:user_id])
    @subject.users << student unless @subject.users.include?(student)
    redirect_to @subject, notice: 'Student enrolled successfully!'
  end
  
  def unenroll
    student = User.find(params[:user_id])
    @subject.users.delete(student)
    redirect_to @subject, notice: 'Student unenrolled successfully!'
  end
  
  private
  
  def set_subject
    @subject = Subject.find(params[:id])
  end
  
  def subject_params
    params.require(:subject).permit(:name, :code, :description)
  end
end