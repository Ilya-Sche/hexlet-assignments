# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:publish, :archive]
  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def publish
    if @vacancy.on_moderate?
      @vacancy.publish!
      redirect_to vacancies_path, notice: 'Vacancy was successfully published.'
    else
      redirect_to vacancies_path, alert: 'Vacancy cannot be published.'
    end
  end

  def archive
    if @vacancy.published?
      @vacancy.archive!
      redirect_to vacancies_path, notice: 'Vacancy was successfully archived.'
    elsif
      @vacancy.on_moderate?
      @vacancy.archive!
      redirect_to vacancies_path, notice: 'Vacancy was successfully archived.'

    else
      redirect_to vacancies_path, alert: 'Vacancy cannot be archived.'
    end
  end

  private
  
  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end
end
