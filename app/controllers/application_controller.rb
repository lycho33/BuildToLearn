class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #gives access to the methods in views

    def current_user
        @user ||= User.find_by_id(session[:user_id]) #if @current_user is already defined, then it will = @current_user. Otherwise it will find-by-id
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end
end
