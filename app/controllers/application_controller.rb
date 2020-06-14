class ApplicationController < ActionController::Base
  # レイアウトをset
  layout :set_layout

  # コントローラの中で発生したStandardErrorを例外処理するメソッドを指定
  rescue_from StandardError, with: :rescue500

  private def set_layout
    # controllerの名前から、staff/admin/customerのどれにマッチするか
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      # マッチした1番目を返す
      Regexp.last_match[1]
    else
      # customerを返す
      "customer"
    end
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
