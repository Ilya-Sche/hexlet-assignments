# frozen_string_literal: true

class Web::ReviewsController < Web::ApplicationController
  before_action :set_movie, except: [:index]

  def index
    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @reviews = @movie.reviews
      render template: 'web/movies/reviews/index'

    else
      @reviews = Review.all
      render template: 'web/reviews/index'
    end
  end

  def show
    @review = @movie.reviews.find params[:id]
  end

  def new
    @review = @movie.reviews.new
    render template: 'web/movies/reviews/new'

  end

  def edit
    @review = @movie.reviews.find params[:id]
    render template: 'web/movies/reviews/edit'
  end

  def create
    @review = @movie.reviews.new(permitted_review_params)

    if @review.save
      redirect_to movie_reviews_path, notice: t('success')
    else
      flash[:alert] = t('fail')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @review = @movie.reviews.find params[:id]

    if @review.update(permitted_review_params)
      redirect_to movie_reviews_path, notice: t('success')
    else
      flash[:alert] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = @movie.reviews.find params[:id]

    @review&.destroy!

    redirect_to movie_reviews_path, notice: t('.success')
  end

  private

  def permitted_review_params
    params.require(:review).permit(:body)
  end
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
