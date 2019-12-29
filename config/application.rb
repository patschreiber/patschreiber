require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"

# Active Job is a framework for declaring jobs and making them run on a variety
# of queuing backends. These jobs can be everything from regularly scheduled
# clean-ups, to billing charges, to mailings. Anything that can be chopped up
# into small units of work and run in parallel, really.
require "active_job/railtie"
require "active_record/railtie"
#require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Action Text brings rich text content and editing to Rails. It includes the
# Trix editor that handles everything from formatting to links to quotes to
# lists to embedded images and galleries. The rich text content generated by the
# Trix editor is saved in its own RichText model that's associated with any
# existing Active Record model in the application. Any embedded images (or other
# attachments) are automatically stored using Active Storage and associated with
# the included RichText model.
# require "action_text/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PatschreiberCom
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified
    # here. Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone. Run "rake -D time" for a list of tasks for
    # finding time zone names. Default is UTC.
    config.time_zone = 'UTC'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Make Active Record use stable #cache_key alongside new #cache_version
    # method. This is needed for recyclable cache keys.
    config.active_record.cache_versioning = true

    config.generators do |g|
      g.template_engine = :haml
      # Disable generation of controller specific asset/helper files.
      g.helper = false
    end

    # Use AES-256-GCM authenticated encryption as default cipher for encrypting
    # messages instead of AES-256-CBC, when use_authenticated_message_encryption
    # is set to true.
    config.active_support.use_authenticated_message_encryption = true

    # Add default protection from forgery to ActionController::Base instead of
    # in ApplicationController.
    config.action_controller.default_protect_from_forgery = true

    # Use SHA-1 instead of MD5 to generate non-sensitive digests, such as the
    # ETag header.
    config.active_support.use_sha1_digests = true

    # Use AES-256-GCM authenticated encryption for encrypted cookies.
    # Also, embed cookie expiry in signed or encrypted cookies for increased
    # security.
    #
    # This option is not backwards compatible with earlier Rails versions.
    # It's best enabled when your entire app is migrated and stable on 5.2.
    #
    # Existing cookies will be converted on read then written with the new
    # scheme.
    config.action_dispatch.use_authenticated_cookie_encryption = true

    # Make `form_with` generate id attributes for any generated HTML tags.
    config.action_view.form_with_generates_ids = true
  end
end
