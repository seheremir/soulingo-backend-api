class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :title, presence: true
  validates :level, presence: true
end