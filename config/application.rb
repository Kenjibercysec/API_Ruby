require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ApiFoda
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Configuração de autoload
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuração do Sidekiq
    config.active_job.queue_adapter = :sidekiq

    # Outras configurações...
    # config.time_zone = "America/Sao_Paulo"
    # config.i18n.default_locale = :'pt-BR'
    
    config.action_dispatch.default_headers = {
  'X-Frame-Options' => 'SAMEORIGIN',
  'X-XSS-Protection' => '1; mode=block',
  'X-Content-Type-Options' => 'nosniff',
  'X-Download-Options' => 'noopen',
  'X-Permitted-Cross-Domain-Policies' => 'none',
  'Referrer-Policy' => 'strict-origin-when-cross-origin'
}
  end
end
