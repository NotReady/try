Rails.application.config.generators do |g|
  g.helper false #=> ヘルパーを作成しない
  g.assets false #=> CSS, JavaScriptファイルを生成しない
  g.skip_routes true #=> config/routes.rbを変更しない
  g.test_framework false #=> テストスクリプトを作成しない
end
