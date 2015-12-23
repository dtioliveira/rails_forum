module UserHelper

  def is_admin(user)
    "<div><strong>ADMIN</strong></div>".html_safe if user.is_admin
  end
end
