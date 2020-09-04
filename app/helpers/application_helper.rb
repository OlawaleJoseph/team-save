module ApplicationHelper
  def display_nav_links
    if current_user
      link_to('Logout', logout_path, method: :delete, class: 'ml-3 mr-4')
    else
      "#{link_to('Login', new_session_path, class: 'mr-4')}
        #{link_to('Register', new_user_path)}".html_safe
    end
  end

  def display_avatar
    avatar = ''
    if current_user&.avatar&.attached?
      avatar << link_to(image_tag(url_for(current_user.avatar), class: 'avatar rounded-circle'), user_path(current_user))
    elsif current_user && !current_user.avatar.attached?
      avatar << link_to(image_tag('user.png', class: 'avatar img-fluid rounded-circle'), user_path(current_user))
    end
    avatar << "<span class='ml-3 d-none d-md-inline text-white'>#{current_user.username} </span>" if current_user
    avatar.html_safe
  end

  def display_top_nav
    return unless current_user

    "<div class='d-flex align-items-center'>
      #{link_to('<i class="far fa-gem pr-1"></i> <span class="d-sm-none d-lg-inline"> My Expenses </span>'.html_safe, expenses_path, class: 'nav-link text-center side-nav-link')}
      #{link_to('<i class="fas fa-money-bill pr-1"></i> <span class="d-sm-none d-lg-inline">External Expenses</span>'.html_safe, external_expenses_path, class: 'nav-link text-center side-nav-link')}
      #{link_to('<i class="fas fa-users pr-1"></i> <span class="d-sm-none d-lg-inline">Teams</span>'.html_safe, teams_path, class: 'nav-link text-center side-nav-link')}
      #{link_to('<i class="fas fa-user-plus pr-1"></i><span class="d-sm-none d-lg-inline">Invitations</span>'.html_safe, '/me/invitations', class: 'nav-link text-center side-nav-link')}
    </div>".html_safe
  end
end
