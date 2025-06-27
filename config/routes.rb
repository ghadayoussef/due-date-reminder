require 'sidekiq/web'

Rails.application.routes.draw do
  # 🔐 Optional: add basic auth in dev/prod
  # if Rails.env.development?
  #   Sidekiq::Web.use Rack::Auth::Basic do |user, pass|
  #     [user, pass] == ["admin", "password"]
  #   end
  # end

  # ✅ Mount Sidekiq web UI
  mount Sidekiq::Web => '/sidekiq'

  get "/test_route", to: ->(env) { [200, {}, ["Routes are working"]] }

  namespace :api do
    namespace :v1 do
      post "reminders/trigger", to: "reminders#trigger"
    end
  end
end
