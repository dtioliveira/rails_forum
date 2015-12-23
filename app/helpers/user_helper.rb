module UserHelper

  def is_admin(user)
    "<div><strong>ADMIN</strong></div>".html_safe if user.is_admin
  end

  def display_admin_cert(user)
    "<div class='admin-cert'></div>".html_safe if user.is_admin
  end
end
