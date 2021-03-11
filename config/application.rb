require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tester
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Europe/Kiev'
    # Permitted locales available for the application
    # config.i18n.available_locales = %i[en ru]
    config.i18n.available_locales = %i[en ru]
    # Set default locale
    config.i18n.default_locale = :en
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
