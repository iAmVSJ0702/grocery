# frozen_string_literal: true

# This is CategoriesController
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @new_category = Category.new
    @all_category = Category.all
  end

  def create
    @new_category = Category.new(category_params)
    if @new_category.save
      redirect_to category_path(@new_category), notice: 'Successfully added category'
    else
      redirect_to new_category_path, notice: 'Category Already exists/Blank Field'
    end
  end

  def edit; end

  def update
    new_category = params[:category][:name]
    @category.update name: new_category.capitalize
    redirect_to new_category_path
  end

  def show; end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Successfully Deleted'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
