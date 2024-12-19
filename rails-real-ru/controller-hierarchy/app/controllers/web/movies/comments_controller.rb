class Web::Movies::CommentsController < Web::Movies::ApplicationController
    before_action :set_movie
    def index
        @comments = @movie.comments.all
      end
  
      def show
        @comment = @movie.comments.find params[:id]
      end
  
      def new
        @comment = @movie.comments.new
      end
  
      def edit
        @comment = @movie.comments.find params[:id]
      end
  
      def create
        @comment = @movie.comments.new(permitted_comment_params)
  
        if @comment.save
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:alert] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end
  
      def update
        @comment = @movie.comments.find params[:id]
  
        if @comment.update(permitted_comment_params)
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:alert] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end
  
      def destroy
        @comment = @movie.comments.find params[:id]
  
        @comment&.destroy!
  
        redirect_to movie_comments_path, notice: t('.success')
      end
  
      private
  
      def permitted_comment_params
        params.require(:comment).permit(:body)
      end

      def set_movie
        @movie = Movie.find(params[:movie_id])
      end
end
