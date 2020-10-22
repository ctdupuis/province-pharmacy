class PostsController < ApplicationController

  def index 
    posts = Post.all.order("created_at DESC")
    render json: PostSerializer.new(posts).to_serialized_json
  end

  def create
    if @current_user
      new_post = Post.create(content: params[:content], user_id: @current_user.id)
      if new_post.save
        render json: PostSerializer.new(new_post).to_serialized_json
      else
        errors = Post.errors.full_messages.map
        render json: { 
          'error': errors,
          created: false
        }
      end
    else
      render json: {
        'error': 'Must be logged in'
      }
    end
  end

  def update
  end

  def destroy
  end
end
