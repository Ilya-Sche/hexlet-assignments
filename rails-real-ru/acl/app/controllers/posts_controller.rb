# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  # BEGIN
attr_reader :user
  def index
    @posts = Post.all
  end

  def show
  end
  
  def new
    @post = Post.new
    authorize @post
  end

  def create
    if current_user.nil?
      raise Pundit::NotAuthorizedError
    end
    @post = current_user.posts.build(post_params)
    authorize @post
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    if @post.destroy!
      redirect_to posts_url
    else
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end
