class User < ApplicationRecord
  has_secure_password
  
  enum role: { student: 0, admin: 1 }
  
  has_and_belongs_to_many :subjects
  has_many :monitorships, dependent: :destroy
  has_many :monitored_subjects, through: :monitorships, source: :subject
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :academic_record, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :role, presence: true
  
  def admin?
    role == 'admin'
  end
  
  def student?
    role == 'student'
  end
  
  def monitored_subject
    monitored_subjects.first
  end
end