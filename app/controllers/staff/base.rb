class Staff::Base < ApplicationController
  private def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  # current_staff_memberをapp/helpers/application_helper.rbに定義
  helper_method :current_staff_member
end