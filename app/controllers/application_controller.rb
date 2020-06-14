class ApplicationController < ActionController::Base
  # レイアウトをset
  layout :set_layout

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
end
