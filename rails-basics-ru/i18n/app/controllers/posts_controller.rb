# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments)
  end

  def show
    logger.debug "params[:post_id]: #{params[:post_id]}"   # Выводим параметры в логи
    logger.debug "params[:id] (comment id): #{params[:id]}"
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: t('posts.post_created.')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update(post_params)
      redirect_to @post, notice: t('posts.post_updated.')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find params[:id]

    @post.destroy

    redirect_to posts_url, notice: t('posts.post_deleted.')
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
