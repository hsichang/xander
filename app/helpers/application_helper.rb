module ApplicationHelper

  def this_user_id
    session[:user_id]
  end

  def this_user
    return nil if this_user_id.nil?

    @this_user ||= User.find(this_user_id)
  end
end
