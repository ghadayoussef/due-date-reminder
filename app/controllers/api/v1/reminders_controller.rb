module Api
  module V1
    class RemindersController < ApplicationController
      def trigger
        Rails.logger.info("trigger function")
        SendDueDateRemindersJob.perform_later(repeat: true)
        render json: { status: "reminder job triggered" }
      end
    end
  end
end