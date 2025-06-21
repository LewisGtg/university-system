class DashboardController < ApplicationController
  def index
    if admin?
      @users_count = User.count
      @subjects_count = Subject.count
      @monitorships_count = Monitorship.count
      @recent_users = User.order(created_at: :desc).limit(5)
    else
      @my_subjects = current_user.subjects
      @monitored_subject = current_user.monitored_subject
    end
  end
end