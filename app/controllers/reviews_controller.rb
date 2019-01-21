class ReviewsController < ApplicationController
    before_action :find_review, only: [:destroy]
    before_action :authenticate_user!
    before_action :authorize_user!, only: [:destroy]

    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        @review.idea = @idea

        @review.user = current_user
        if @review.save
            redirect_to idea_path(@idea.id)
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render "ideas/show"
        end

        @review.save
    end

    def destroy
        @review.destroy
        redirect_to review_path(@review.question)
    end

    private
    def review_params
        params.require(:review).permit(:body)
    end

    def find_review
        @idea = Review.find params[:id]
    end

    def authorize_user!
        unless can?(:crud, @review)
            flash[:danger] = "Access Denied"
            redirect_to idea_path()
        end
    end
end
