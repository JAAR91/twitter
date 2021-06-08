module PostsHelper
    def elapsed_time(start)
        "#{seconds_to_hms((Time.now - start).to_i)}"
    end

    def seconds_to_hms(sec)
        return "#{sec} S" if sec <60
        day = 0
        hour = 0
        min = 0
        while sec > 60
            min += 1
            sec -= 60
            if min == 60
                hour += 1
                min = 0
            end
            if hour == 24
                day += 1
                hour = 0
            end
        end

        if day > 0
            return "#{day} D"
        elsif hour > 0
            return "#{hour} H"
        elsif min > 0
            return "#{min} M"
        end
    end

    def new_post(user)
        if user.id == current_user.id
            return render "posts/newpost"
        else
            
        end
    end

    def picture?(picture, style = nil)
        if picture.attached?
            image_tag picture, class:style
        end
    end
end
