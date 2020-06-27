class Staff::Authenticator
  def initialize(staff_member)
    @staff_member = staff_member
  end

  # 与えられたStaffMemberオブジェクトが
  # nilでない + 有効 + パスワードが設定済みである + 開始日が今日以前 + 終了日が(設定されていない or 今日より後) + パスワードが正しい
  # 場合にtrueを返す
  def authenticate(raw_password)
    @staff_member &&
        @staff_member.hashed_password &&
        @staff_member.start_date <= Date.today &&
        (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
        BCrypt::Password.new(@staff_member.hashed_password) == raw_password
  end
end