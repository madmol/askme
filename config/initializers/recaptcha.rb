Recaptcha.configure do |config|
  config.site_key =
    if Rails.env.development?
      Rails.application.credentials[:RECAPTCHA_ASKME_SITE_KEY]
    elsif Rails.env.production?
      ENV['RECAPTCHA_ASKME_SITE_KEY']
    end

  config.secret_key =
    if Rails.env.development?
      Rails.application.credentials[:RECAPTCHA_ASKME_SECRET_KEY]
    elsif Rails.env.production?
      ENV['RECAPTCHA_ASKME_SECRET_KEY']
    end
end
