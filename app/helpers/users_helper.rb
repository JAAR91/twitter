module UsersHelper
  def profile_pic(avatar, style = '')
    if avatar.attached?
        image_tag current_user.avatar, class: 'user_avatar rounded img-thumbnail shadow-around'
    else
        image_tag 'empty_user.png', class: 'user_avatar rounded img-thumbnail shadow-around'
    end
    
  end

  def active_link(controller, action, link)
    case link
    when 'home'
      return 'active' if controller == 'posts' && action == 'index'
    when 'profile'
      return 'active' if controller == 'users'
    end
    ''
  end

  def banner?(banner, style = '')
    if banner.attached?
        image_tag banner, class: style
    else
        image_tag 'banner.png', class: style
    end
  end
end
