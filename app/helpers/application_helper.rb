module ApplicationHelper
  def session_link_helper
    if user_signed_in?
      link_to_logout("Logout")
    else
      link_to_login("Login")
    end
  end

  private

  def link_to_login(link_text)
    link_to link_text, new_user_session_path
  end

  def link_to_logout(link_text)
    link_to link_text, destroy_user_session_path, method: :delete
  end
end
