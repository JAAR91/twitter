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

  def delete_post(post)
    render 'posts/delete', id: post.id if post.user_id == current_user.id
  end

  def oldestlink_destination(lastpostdate)
    return 'This is the last page' if lastpostdate == 0
    if params[:controller] == 'posts' && params[:action] == 'index'
      link_to 'Previous Posts', root_path(lastpostdate: lastpostdate), class:"link-info"
    elsif params[:controller] == 'posts' && params[:action] == 'ousers'
      link_to 'Previous Posts', ousers_path(lastpostdate: lastpostdate), class:"link-info"
    end
  end
end
