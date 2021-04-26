class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #gives access to the methods in views

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) #if @current_user is already defined, then it will = @current_user. Otherwise it will find-by-id
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in
    end
end
