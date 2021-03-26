class CommentsController < ApplicationController
    before_action :set_post

    def create
        comment = @post.comments.build(content: params[:content], user_id: params[:user_id])
        if comment.save
            render json: comment, methods: [:created, :updated, :author]
        else
            errors = comment.errors.full_messages.map
            render json: { error: errors }
        end
    end

    def update 
        comment = @post.comments.find(params[:id])
        comment.update(
            content: params[:content],
            edited: true
        )
        if comment.save
            render json: comment, methods: [:created, :updated, :author]
        else
            errors = comment.error.full_messages.map
            render json: { error: errors }
        end
    end

    def destroy
        @post.comments.find(params[:id]).destroy
        render json: { status: 200 }
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end
end