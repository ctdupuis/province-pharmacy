class PostsController < ApplicationController

  def index 
    posts = Post.all.order("created_at DESC")
    render json: PostSerializer.new(posts).to_serialized_json
  end

  def create
    if @current_user
      post = Post.create(content: params[:content], user_id: @current_user.id)
      if post.save
        render json: { 
          'post': post,
          created: true
        }
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
