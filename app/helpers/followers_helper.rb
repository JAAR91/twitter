module FollowersHelper
  def follow_link(id)
    if id == current_user.id
      ''
    else
      follow_check(id)
    end
  end

  def follow_check(id)
    follow = current_user.followers.find_by(follow_id: id)
    if follow
      render 'followers/unfollow', id: id
    else
      render 'followers/follow', id: id
    end
  end

  def findnewfollowers(user)
    ids = user.followers.pluck(:follow_id) << user.id
    User.where.not(id: ids).last(3)
  end
end
