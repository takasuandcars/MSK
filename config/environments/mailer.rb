if Rails.env.development?

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.shibamata.co.jp',
    domain: 'shibamata.co.jp',
    port: 587,
    user_name: 's-isogai%shibamata.co.jp',
    password: 'isogai3104',
    authentication: 'login',
    enable_starttls_auto: false
  }

end
