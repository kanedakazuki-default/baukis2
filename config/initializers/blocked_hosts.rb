# ホスト名を制限する BlockedHosts にホワイトリストを登録
Rails.application.configure do
  config.hosts << "example.com"
  config.hosts << "baukis2.example.com"
end