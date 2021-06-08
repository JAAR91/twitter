module UsersHelper
  def profile_pic(avatar, style = '')
    if avatar.attached?
        image_tag avatar, class: style
    else
        image_tag 'nocatfound.png', class: style
    end
    
  end

  def active_link(controller, action, link)
    case link
    when 'home'
      return 'active' if controller == 'posts' && action == 'index'
    when 'profile'
      return 'active' if controller == 'users' && action == 'show'
    when 'connect'
        return 'active' if controller == 'users' && action == 'index'
    end
    ''
  end

  def banner?(banner, style = '')
    if banner.attached?
        image_tag banner, class: style
    else
        image_tag 'noimagefound', class: style
    end
  end

  def option_link(id)
    if id == current_user.id
        return ''
    else
        link_to image_tag('menu.png'), root_path, class:'btn btn-outline-secondary rounded-circle py-2'
    end
  end

  def logginwide
    'w-100' unless logged_in?
  end
end
