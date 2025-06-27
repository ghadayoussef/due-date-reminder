require 'rails_helper'

RSpec.describe "Api::V1::Reminders", type: :request do
  describe "POST /api/v1/reminders/trigger" do
    it "enqueues SendDueDateRemindersJob and returns success response" do
      # Clear enqueued jobs before test
      ActiveJob::Base.queue_adapter = :test
      expect {
        post "/api/v1/reminders/trigger"
      }.to have_enqueued_job(SendDueDateRemindersJob)

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq("reminder job triggered")
    end
  end
end
