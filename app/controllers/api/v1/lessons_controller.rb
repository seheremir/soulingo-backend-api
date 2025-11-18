module Api
  module V1
    class LessonsController < ApplicationController
      before_action :authorize_request
      before_action :set_lesson, only: [:show, :generate_video]

      # ENDPOINT 4: Ders Detayı
      # GET /api/v1/lessons/:id
      def show
        render json: @lesson.as_json(include: :video_generation)
      end

      # ENDPOINT 5: Video Üretimi (Mock/Simülasyon)
      # POST /api/v1/lessons/:id/generate
      def generate_video
        # D-ID servisini devre dışı bıraktık (Mocking)
        # did_service = DidService.new
        # result = did_service.create_talk(@lesson.content)

        # Sanki başarılı olmuş gibi sahte cevap üretiyoruz
        result = {
          "id" => "mock_id_#{SecureRandom.hex(4)}", # Rastgele ID
          "status" => "created",
          "provider" => "d-id (mock)",
          "http_status" => 201
        }

        # Veritabanına kaydediyoruz
        VideoGeneration.create!(
          lesson: @lesson,
          external_id: result['id'],
          status: result['status'],
          provider: result['provider']
        )
        
        render json: { message: 'Video generation started (MOCK MODE)', data: result }, status: :created
      end

      private

      def set_lesson
        @lesson = Lesson.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Lesson not found' }, status: :not_found
      end
    end
  end
end