require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Baukis2
  class Application < Rails::Application
    config.load_defaults 6.0

    # タイムゾーンを東京に設定
    config.time_zone = "Tokyo"
    # 国際化のためのデータファイルのロードパスを設定
    config.i18n.load_path +=
        Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    # デフォルトロケールを日本語に設定
    config.i18n.default_locale = :ja

    # ジェネレータによるファイルの作成をoffに設定
    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.assets false
      #　テストフレームワークをmini_testからRSpecに変更
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
  end
end
