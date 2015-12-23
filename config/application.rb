require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testvoltmobi
  class Application < Rails::Application
    config.generators.assets = false
    config.generators.helper = false
    config.generators.view_specs false

    config.i18n.load_path = Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    config.active_record.raise_in_transactional_callbacks = true

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      "<div class='has-error'>#{html_tag}</div>".html_safe
    end
  end
end
