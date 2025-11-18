class Lesson < ApplicationRecord
  belongs_to :course
  has_one :video_generation, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end