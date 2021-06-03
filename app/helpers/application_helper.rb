module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
    end

    def left_bar_render
      render "navbars/leftbar" if logged_in?
    end

    def top_bar_render
      render "navbars/topbar" if logged_in?
    end

    def rigth_bar_render
      render "navbars/rigthbar" if logged_in?
    end

    def mainpageshadowbox
     'shadow-around' if logged_in?
    end
end
