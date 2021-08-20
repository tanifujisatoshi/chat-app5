require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatApp5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    # このファイルにはこのアプリにおいて共通となる設定を記述する
    # i18nを使うことである言語の文言を別の文言に翻訳してくれる
     # 今回は日本語に翻訳される
    # validationのエラーが日本語になったり新規登録のNameが「名前」になる
    config.time_zone = 'Tokyo'
    # タイムゾーンを東京に合わせている

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
