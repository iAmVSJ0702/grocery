# frozen_string_literal: true

# This is SubcategoriesController
class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: %i[edit show update destroy]
  def index
    @categories = Category.all
  end

  def show; end

  def subcategory
    @target = params[:target]
    @subcategory = Category.find_by(id: params[:cat_id]).subcategories.all
    respond_to(&:turbo_stream)
  end

  def new
    if params[:category][:id] == ''
      redirect_to admin_index_path
    else
      @subcategory = Subcategory.new
      @category = Category.find_by(id: params[:category][:id])
      @subcategories = @category.subcategories.all
      @catname = @category[:name]
    end
  end

  def edit; end

  def update
    new_name = params[:subcategory][:name]
    new_category = Category.find_by(id: params[:category])
    @subcategory.update(name: new_name)
    new_category.subcategories << @subcategory
    if @subcategory.errors.any?
      flash[:notice] = 'Not Updated: The Category might already have an subcategory with the same name / Empty Field'
      redirect_to action: 'edit'
    else
      flash[:notice] = 'Updated Successfully'
      redirect_to action: 'new', category: { id: params[:category] }
    end
  end

  def create
    category_id = params[:subcategory][:category]
    subcategory_name = params[:subcategory][:name]
    @category = Category.find_by(id: category_id)
    @subcategory = @category.subcategories.create(name: subcategory_name.capitalize)
    if @subcategory.save
      redirect_to subcategory_path(@subcategory), notice: 'Successfully added subcategory'
    else
      render :new, notice: 'Subcategory Already exists/Blank Field'
    end
  end

  def destroy
    category_id = @subcategory.category.id
    @subcategory.destroy
    redirect_to subcategories_path, notice: 'Successfully Deleted'
  end

  def for_categoryid
    @subcategories = Subcategory.find_all_by_section_id(params[:id]).sort_by { |k| k['name'] }
    respond_to do |format|
      format.json { render json: @subcategories }
    end
  end

  private

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end
end
