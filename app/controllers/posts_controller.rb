class PostsController < ApplicationController

  def index 
    if @current_user.username == "DEM"
      posts = Post.all.select{|p| p.user_id == @current_user.id}
      render json: PostSerializer.new(posts).to_serialized_json
    else
      posts = Post.all.order("created_at DESC").select{|p| p.author != "DEM"}
      render json: PostSerializer.new(posts).to_serialized_json
    end
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
