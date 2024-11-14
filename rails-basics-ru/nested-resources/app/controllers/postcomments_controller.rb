class PostcommentsController < ApplicationController
  before_action :set_post, only: %i[ index new create ]
  before_action :set_postcomment, only: %i[ show edit update destroy ]

  # GET /postcomments or /postcomments.json
  def index
    @postcomments = @post.postcomments
  end

  # GET /postcomments/1 or /postcomments/1.json
  def show
  end

  # GET /postcomments/new
  def new
    @postcomment = @post.postcomments.build
  end

  # GET /postcomments/1/edit
  def edit
    @postcomment = Postcomment.find params[:id]
  end

  # POST /postcomments or /postcomments.json
  def create
    @postcomment = @post.postcomments.build(postcomment_params)

    respond_to do |format|
      if @postcomment.save
        format.html { redirect_to post_path(@post), notice: "Postcomment was successfully created." }
        format.json { render :show, status: :created, location: @postcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @postcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postcomments/1 or /postcomments/1.json
  def update
    respond_to do |format|
      if @postcomment.update(postcomment_params)
        format.html { redirect_to post_path(@post), notice: "Postcomment was successfully updated." }
        format.json { render :show, status: :ok, location: @postcomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @postcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcomments/1 or /postcomments/1.json
  def destroy
    @postcomment.destroy!

    respond_to do |format|
      format.html { redirect_to post_path(@post), status: :see_other, notice: "Postcomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_postcomment
      @postcomment = Postcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postcomment_params
      params.require(:postcomment).permit(:body, :post_id)
    end
end
