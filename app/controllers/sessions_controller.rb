class SessionsController < ApplicationController
    def home #but you don't really need it
    end

    def logout
        session.clear
        redirect_to login_path
    end

    #for login
    def create
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            flash[:message] = "Successfully signed in"
            session[:user_id] = @user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login information. Please try again."
            render :new
        end
    end

    
end
