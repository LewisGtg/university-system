class Subject < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :monitorship, dependent: :destroy
  has_one :monitor, through: :monitorship, source: :user
  
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true
  
  def students
    users.where(role: 'student')
  end
  
  def has_monitor?
    monitorship.present?
  end
end