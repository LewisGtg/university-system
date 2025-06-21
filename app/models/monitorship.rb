class Monitorship < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  
  validates :user_id, uniqueness: { scope: :subject_id }
  validate :user_must_be_student
  validate :user_cannot_be_enrolled_in_subject
  
  private
  
  def user_must_be_student
    errors.add(:user, "must be a student") unless user&.student?
  end
  
  def user_cannot_be_enrolled_in_subject
    if user&.subjects&.include?(subject)
      errors.add(:user, "cannot be monitor of a subject they are enrolled in")
    end
  end
end