class PostsController < ApplicationController

  def index
    if @current_user.demo
      posts = Post.all.order("created_at DESC").select{ |p| p if p.user.demo }
    else
      posts = Post.all.order("created_at DESC").select{ |p| p if !p.user.demo }
    end
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
    post = Post.find(params[:id])
    post.update_attribute(:content, params[:content])
    if post.save 
      render json: PostSerializer.new(post).to_serialized_json
    else
      render json: { updated: false }
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    render json: { status: 200 }
  end
end
