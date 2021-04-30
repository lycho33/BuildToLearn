class StatusesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_lesson, only: [:index, :new, :create]

    def index
        if @user
            @statuses = @user.statuses 
        else
            flash[:message] = "This user does not exist"
            @statuses = Status.all
        end
    end

    def new
        @status = Status.new
    end

    def create
        @status = current_user.status.build(status_params)
        @status.user_id = current_user.id
        @status.lesson_id #fix this
        if @status.save
            redirect_to status_path(@status)
        else
            render :new
        end
    end

    def show
        @status = Status.find_by(id: params[:id])
    end

    def edit
        @status = Status.find_by(id: params[:id])
    end

    def update
        @status = Status.find_by(id: params[:id])
        @status.update(status_params)

        if @status.valid?
            redirect_to user_statuses_path(@status)
        else
            render :edit
        end
    end

    def destroy
        @status = Status.find_by(id: params[:id])
        @status.destroy
        redirect_to statuses_path
    end

    private

    def status_params
        params.require(:status).permit(:interested_topics, :progress_level, :user_id, 
        user_attributes: [:name, :username])
    end

    def find_lesson
        @user = User.find_by_id(params[:user_id]) #it will return nil 
    end
end
