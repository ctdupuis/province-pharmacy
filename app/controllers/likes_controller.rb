class LikesController < ApplicationController

    def new
        like = Like.create(user_id: @current_user.ic, post_id: params[:post_id])
        if like
            render json: { status: 200, like: like}
        else
            render json: { status: 404, error: "Cannot be liked at this time."}
        end
    end

end