class StatusesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_lesson, only: [:index, :new, :create]

    def index
        if @user
            @roles = @user.roles 
        else
            flash[:message] = "This user does not exist"
            @roles = Role.all
        end
    end

    def new
        if @user
            @role = @user.roles.build
        else
            @role = Role.new
            @role.build_lesson
        end
    end

    def create
        @role = current_user.roles.build(role_params)

        if @role.save
            if @user
                redirect_to user_roles_path(@user)
            else
                redirect_to role_path
            end
        else
            redirect_to new_user_role_path(@user)
        end
    end

    def show
        @role = Role.find_by(id: params[:id])
    end

    def edit
        @role = Role.find_by(id: params[:id])
    end

    def update
        @role = Role.find_by(id: params[:id])
        @role.update(role_params)

        if @role.valid?
            redirect_to user_roles_path(@role)
        else
            render :edit
        end
    end

    def destroy
        @role = Role.find_by(id: params[:id])
        @role.destroy
        redirect_to roles_path
    end

    private

    def role_params
        params.require(:role).permit(:status, :interested_topics, :progress_level, :lesson_id, :user_id, 
        user_attributes: [:name, :username])
    end

    def find_lesson
        @user = User.find_by_id(params[:user_id]) #it will return nil 
    end
end
