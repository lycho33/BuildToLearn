class UsersController < ApplicationController
    def index
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
    end

    #for sign up
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed in!"
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        # redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end
end
