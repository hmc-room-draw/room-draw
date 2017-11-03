OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "810840116642-c3snbc808k3ugma6st4oln3dvk84rr93.apps.googleusercontent.com", "XhnAjQsjl6U8iR7Nmnn2vJOm"
end

Rails.application.config.form_url = ENV['FORM_URL']
