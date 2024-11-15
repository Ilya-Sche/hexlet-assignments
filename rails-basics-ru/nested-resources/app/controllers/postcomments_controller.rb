class PostcommentsController < ApplicationController
  before_action :set_post, only: %i[new create index]
  before_action :set_postcomment, only: %i[show edit update destroy]

  # GET /posts/:post_id/postcomments
  def index
    @postcomments = @post.postcomments
  end

  # GET /postcomments/:id
  def show
    @post = @postcomment.post
  end

  # GET /posts/:post_id/postcomments/new
  def new
    @postcomment = @post.postcomments.build
  end

  # GET /postcomments/:id/edit
  def edit
    @post = @postcomment.post
  end

  # POST /posts/:post_id/postcomments
  def create
    @postcomment = @post.postcomments.build(postcomment_params)

    if @postcomment.save
      redirect_to post_path(@post), notice: 'Комментарий был успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /postcomments/:id
  def update
    @post = @postcomment.post
    if @postcomment.update(postcomment_params)
      redirect_to post_path(@post), notice: 'Комментарий был успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /postcomments/:id
  def destroy
    @post = @postcomment.post
    @postcomment.destroy
    redirect_to post_path(@post), notice: 'Комментарий был успешно удален.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_postcomment
    @postcomment = Postcomment.find(params[:id])
  end

  def postcomment_params
    params.require(:postcomment).permit(:body, :post_id)
  end
end
