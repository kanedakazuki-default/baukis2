Rails.application.configure do
  # 本の進め方の関係上、一時的にStrongParametersを無効化
  config.action_controller.permit_all_parameters = true
end