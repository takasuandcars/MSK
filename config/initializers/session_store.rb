if Rails.env === 'production'
  # 本番環境の設定（自分のドメインを追記）
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'フロントエンドのドメイン'
else
  # 開発環境の設定
  Rails.application.config.session_store :cookie_store, key: '_auth-app-api'
end
