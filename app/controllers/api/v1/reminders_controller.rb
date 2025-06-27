module Api
  module V1
    class RemindersController < ApplicationController
      def trigger
        SendDueDateRemindersJob.perform_later
        render json: { status: "reminder job triggered" }
      end
    end
  end
end