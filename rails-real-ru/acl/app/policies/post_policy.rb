# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  attr_reader :user, :post

  def create?
    user.present?
  end

  def update?
    user.present? && (record.author == user || user.admin?)
  end

  def destroy?
    user.present? && user.admin?
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    user.present?
  end
  # END
end
