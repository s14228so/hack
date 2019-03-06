require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Etoria
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.template_engine :erb
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
      g.fixture_replacement :factory_bot, dir: "spec/support/factories"
    end
    
    config.generators.system_tests = nil
  end
end
