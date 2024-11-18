# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :resource_post
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Posts::Comment.all
  end
  
  def edit
    resource_post
    @comment = @resource_post.comments.find(params[:id])
  end

  def create
    resource_post
    @comment = @resource_post.comments.build(comment_params)

    if @comment.save
      redirect_to @resource_post, notice: t('comments.create.success')
    else
        logger.debug "Errors: #{@comment.errors.full_messages.join(', ')}"
      redirect_to @resource_post
    end
  end

  def new
    @comment = @resource_post.comments.new
  end

  def update
    resource_post
    @comment = @resource_post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @resource_post, notice: t('comments.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resource_post
    @comment = @resource_post.comments.find(params[:id])
    @comment.destroy

    redirect_to @resource_post
  end

  private

  # Only allow a list of trusted parameters through.

  def set_comment
    @comment = @resource_post.comments.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:body, :post_id)
  end
end
