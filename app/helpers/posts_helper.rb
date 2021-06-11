module PostsHelper
  def elapsed_time(start)
    seconds_to_hms((Time.now - start).to_i).to_s
  end

  def seconds_to_hms(sec)
    return "#{sec} S" if sec < 60

    min = sec / 60
    return "#{min} M" if min < 60

    hour = min / 60
    return "#{hour} H" if hour < 24

    day = hour / 24
    return "#{day} D" if day < 8

    week = day / 7
    return "#{week} W" if week < 5

    month = week / 4
    return "#{month} M" if month < 13

    month / 12
  end

  def new_post(user)
    render 'posts/newpost' if user.id == current_user.id
  end

  def picture?(picture, style = nil)
    image_tag picture, class: style if picture.attached?
  end

  def picture_posts(user)
    ids = []
    user.posts.each do |item|
      ids << item.id if item.picture.attached?
    end
    Post.where(id: ids)
  end

  def delete_post(apost)
    render 'posts/delete', id: apost.id if apost.user_id == current_user.id
  end

  def oldestlink_destination(lastpostdate, id = nil)
    return 'This is the last page' if lastpostdate == 'last'
    return 'No posts found for curret user' if lastpostdate == 'emtpy'

    result = lastpostindex(lastpostdate)
    return result unless result.nil?

    result = lastpostousers(lastpostdate)
    return result unless result.nil?

    result = lastpostsusers(lastpostdate, id)
    return result unless result.nil?
  end

  def lastpostindex(lastpostdate)
    if params[:controller] == 'posts' && params[:action] == 'index'
      return link_to 'Previous Posts', root_path(lastpostdate: lastpostdate),
                     class: 'link-info'
    end
    nil
  end

  def lastpostousers(lastpostdate)
    if params[:controller] == 'posts' && params[:action] == 'ousers'
      return link_to 'Previous Posts', ousers_path(lastpostdate: lastpostdate),
                     class: 'link-info'
    end
    nil
  end

  def lastpostsusers(lastpostdate, id)
    if params[:controller] == 'users' && params[:action] == 'show'
      return link_to 'Previous Posts', user_path(id, lastpostdate: lastpostdate),
                     class: 'link-info'
    end
    nil
  end

  def posts_check(posts)
    if posts.count.zero?
      "<p class='rounded-4 bg-light shadow p-3 text-muted text-center'>No posts found for this user</p>".html_safe
    end
    nil
  end
end
