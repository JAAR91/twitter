module UsersHelper
  def profile_pic(avatar, style = '')
    if avatar.attached?
      image_tag avatar, class: style
    else
      image_tag 'nocatfound.png', class: style
    end
  end

  def home_link(controller, action)
    return 'active' if controller == 'posts' && action == 'index'

    ''
  end

  def profile_link(controller, action)
    return 'active' if controller == 'users' && action == 'show'

    ''
  end

  def connect_link(controller, action)
    return 'active' if controller == 'users' && action == 'index'

    ''
  end

  def discover_link(controller, action)
    return 'active' if controller == 'posts' && action == 'ousers'

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
      ''
    else
      link_to image_tag('menu.png'), root_path, class: 'btn btn-outline-dark rounded-circle p-0 m-0 border-0'
    end
  end

  def logginwide
    return 'col-10' if logged_in?

    'col-12'
  end

  def newuser
    return 'col-2' if logged_in?

    ''
  end
end
