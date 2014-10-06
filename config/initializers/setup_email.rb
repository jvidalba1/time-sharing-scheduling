mail_config_file = YAML.load_file("#{Rails.root}/config/config_files/email.yml")
APP_URLS =  mail_config_file["url_options"].symbolize_keys
ActionMailer::Base.smtp_settings =  mail_config_file["smtp"].symbolize_keys
