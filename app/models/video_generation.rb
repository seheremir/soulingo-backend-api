class VideoGeneration < ApplicationRecord
  belongs_to :lesson

  # Durumlar: pending (bekliyor), processing (işleniyor), completed (bitti), failed (hata)
  validates :status, presence: true, inclusion: { in: %w[pending processing completed failed] }
  validates :external_id, presence: true
end