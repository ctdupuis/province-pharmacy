class CommentsController < ApplicationController
    before_action :set_post

    def create
        comment = @post.comments.build(content: params[:content], user_id: params[:user_id])
        if comment.save
            render json: comment
        else
            errors = comment.errors.full_messages.map
            render json: { error: errors }
        end
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end
end