class ApplicationController < ActionController::Base
  # レイアウトをset
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # コントローラの中で発生したStandardErrorを例外処理するメソッドを指定
  rescue_from StandardError, with: :rescue500
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403

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

  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
