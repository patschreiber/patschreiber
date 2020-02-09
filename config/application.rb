# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'

# Active Job is a framework for declaring jobs and making them run on a variety
# of queuing backends. These jobs can be everything from regularly scheduled
# clean-ups, to billing charges, to mailings. Anything that can be chopped up
# into small units of work and run in parallel, really.
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
# Action Text brings rich text content and editing to Rails. It includes the
# Trix editor that handles everything from formatting to links to quotes to
# lists to embedded images and galleries. The rich text content generated by the
# Trix editor is saved in its own RichText model that's associated with any
# existing Active Record model in the application. Any embedded images (or other
# attachments) are automatically stored using Active Storage and associated with
# the included RichText model.
# require "action_text/railtie"
require 'action_view/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'

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

    # Don't force requests from old versions of IE to be UTF-8 encoded.
    config.action_view.default_enforce_utf8 = false

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

    # Store boolean values are in sqlite3 databases as 1 and 0 instead of 't' and
    # 'f' after migrating old data.
    config.active_record.sqlite3.represent_boolean_as_integer = true

    # Embed purpose and expiry metadata inside signed and encrypted
    # cookies for increased security.
    config.action_dispatch.use_cookies_with_metadata = true

    # Change the return value of `ActionDispatch::Response#content_type` to
    # Content-Type header without modification.
    config.action_dispatch.return_only_media_type_on_content_type = false

    # Return false instead of self when enqueuing is aborted from a callback.
    config.active_job.return_false_on_aborted_enqueue = true

    # Use SHA-1 instead of MD5 to generate non-sensitive digests, such as the ETag header.
    config.active_support.use_sha1_digests = true

    # Use ActionMailer::MailDeliveryJob for sending parameterized and normal
    # mail.
    #
    # The default delivery jobs (ActionMailer::Parameterized::DeliveryJob,
    # ActionMailer::DeliveryJob), will be removed in Rails 6.1. This setting is
    # not backwards compatible with earlier Rails versions. If you send mail in
    # the background, job workers need to have a copy of MailDeliveryJob to
    # ensure all delivery jobs are processed properly. Make sure your entire app
    # is migrated and stable on 6.0 before using this setting.
    config.action_mailer.delivery_job = 'ActionMailer::MailDeliveryJob'

    # Enable the same cache key to be reused when the object being cached of
    # type `ActiveRecord::Relation` changes by moving the volatile information
    # (max updated at and count) of the relation's cache key into the cache
    # version to support recycling cache key.
    config.active_record.collection_cache_versioning = true

    # When assigning to a collection of attachments declared via
    # `has_many_attached`, replace existing attachments instead of appending.
    # Use #attach to add new attachments without replacing existing ones.
    config.active_storage.replace_on_assign_to_many = true

    # Send Active Storage analysis and purge jobs to dedicated queues.
    config.active_storage.queues.analysis = :active_storage_analysis
    config.active_storage.queues.purge    = :active_storage_purge
  end
end
