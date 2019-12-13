# Be sure to restart your server when you modify this file.

PatschreiberCom::Application.config.session_store :cookie_store,
  key: '_ps_sess',
  secure: Rails.env.production?,
  same_site: :strict
