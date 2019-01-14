class IdeasController < ApplicationController

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new idea_params

        if @idea.save
            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end

    def index
        @ideas = Idea.all.order(created_at: :desc)
    end

    def show

    end

    def edit

    end

    def update

        if @idea.update idea_params
            redirect_to idea_path(@idea.id)
        else
            render :edit
        end
    end

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end

    private
    def idea_params
        params.require(:idea).permit(:title, :description)
    end

    def find_idea
        @idea = Idea.find params[:id]
    end
end
