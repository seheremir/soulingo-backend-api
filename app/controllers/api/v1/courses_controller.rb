module Api
  module V1
    class CoursesController < ApplicationController
      # Token kontrolünü devre dışı bırakmak istersen bu satırı yorumla
      before_action :authorize_request

      # GET /api/v1/courses (Madde 2)
      def index
        @courses = Course.all
        render json: @courses
      end

      # GET /api/v1/courses/:id
      def show
        @course = Course.find(params[:id])
        render json: @course.as_json(include: :lessons)
      end
    end
  end
end