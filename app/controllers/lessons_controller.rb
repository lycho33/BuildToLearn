class LessonsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @lessons = Lesson.all
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        @lesson.user_id = current_user.id #current_user/build doesn't work as expected 
        if @lesson.save
            redirect_to lesson_path(@lesson)
        else
            render :new 
        end
    end

    def show
        @lesson = Lesson.find(params[:id])
    end

    def edit
        @lesson = Lesson.find(params[:id])
    end

    def update
        @lesson = Lesson.find_by(id: params[:id])
        @lesson.update(lesson_params)

        if @lesson.valid?
            redirect_to lessons_path(@lesson)
        else
            render :edit 
        end
    end

    def destroy
        @lesson = Lesson.find_by(id: params[:id])
        @lesson.destroy
        redirect_to lessons_path(@lesson)
    end

    private
    def lesson_params 
        params.require(:lesson).permit(:title, :topic, :content)
    end
end
