# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    @repository = Repository.create!(permitted_params)
    
    RepositoryLoaderJob.perform_later(@repository)
    
    redirect_to @repository
  end

  def update
    @repository = Repository.find(params[:id])
    
    RepositoryLoaderJob.perform_later(@repository)
    
    redirect_to @repository
  end

  def update_repos
      Repository.all.order(updated_at: :asc).each do |repository|
        RepositoryLoaderJob.perform_later(repository)
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
