module UsersHelper
    def profile_pic(avatar)
        if avatar.any.nil?
            return image_tag "empty_user.png", class:'user_avatar rounded img-thumbnail shadow-around'
        else
            image_tag current_user.avatar, class:'user_avatar rounded img-thumbnail shadow-around'
        end
    end
end
