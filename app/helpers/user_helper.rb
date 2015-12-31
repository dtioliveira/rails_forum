# I'm pretty sure I'm a top-level class documentation comment
module UserHelper
  def admin?(user)
    '<div><strong>ADMIN</strong></div>'.html_safe if user.is_admin
  end

  def display_admin_cert(user)
    '<div class="admin-cert"></div>'.html_safe if user.is_admin
  end
end
