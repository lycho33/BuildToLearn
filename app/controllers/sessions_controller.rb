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

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.name = auth[:info][:name]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end
        if @user.valid?
            flash[:message] = "Successfully signed in with Google" 
            session[:user_id] = @user.id
            redirect_to users_path ##fix the path 
        else
            flash[:message] = "Credential error"
            redirect_to login_path
        end
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end
