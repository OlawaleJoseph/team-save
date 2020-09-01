module ApplicationHelper

  def display_nav_links
    if current_user
        return link_to('Logout', logout_path, method: :delete, class: 'ml-3 mr-4')
    else
        return "#{link_to('Login', new_session_path, class: 'mr-4')}
        #{link_to('Register', new_user_path)}".html_safe
    end
  end

  def display_avatar
    if current_user && current_user.avatar.attached?      
      return image_tag(url_for(current_user.avatar), class: 'avatar')
    elsif current_user && !current_user.avatar.attached?
      return image_tag('user.png', class: 'avatar img-fluid')
    end
  end
end
