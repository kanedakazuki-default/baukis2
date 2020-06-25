Rails.application.configure do
  # form_withメソッドをAjaxリクエストにしない
  config.action_view.form_with_generates_remote_forms = false
end