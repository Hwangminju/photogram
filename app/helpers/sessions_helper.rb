module SessionsHelper
    # 전달된 사용자로 로그인 
    def log_in(user) 
        session[:user_id] = user.id 
    end 
    
    # 현재 로그인 한 사용자를 반환(로그인 한 경우에만) 
    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) 
        # (1) 
        # if @current_user.nil? 
        #   @current_user = User.find_by(id: session[:user_id]) 
        # else 
        #   @current_user = @current_user 
        # end 
        # (2) 
        # @current_user = @current_user || User.find_by(id: session[:user_id]) 
    end 
        
    # 로그인 되어있다면 true 를 그렇지 않다면 false 를 반환 
    def user_signed_in? 
        !current_user.nil? 
    end 
    
    # session[:user_id]와 @current_user 삭제 
    def log_out 
        session.delete(:user_id) 
        @current_user = nil 
    end
end
