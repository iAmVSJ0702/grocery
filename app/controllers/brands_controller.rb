# frozen_string_literal: true

# This is BrandsController
class BrandsController < ApplicationController
  before_action :set_subcategory
  before_action :set_brand

  def index
    @subcategories = Subcategory.all
  end

  def show; end

  def create
    subcategory_id = params[:brand][:subcategory]
    @subcategory = Subcategory.find_by(id: subcategory_id)
    category_id = @subcategory.category.id
    brand = params[:brand][:name]
    @new_brand = @subcategory.brands.create(name: brand.capitalize)
    if @new_brand.save
      redirect_to brand_path(@new_brand), notice: 'Successfully added brand'
    else
      render :new, notice: 'Brand Already exists/Blank Field'
    end
  end

  def new
    if params[:category] == '' || params[:subcategory] == ''
      redirect_to admin_index_path, notice: 'Please enter parameters'
    else
      @new_brand = Brand.new
      @category = Category.find_by(id: params[:category])
      @subcategory_name = @subcategory.name
      @brands = @subcategory.brands.all
    end
  end

  def edit
    @category = @brand.subcategory.category
    @subcategory = @category.subcategories.all
  end

  def update
    if params[:subcategory] == '' || params[:brand][:name] == ''
      redirect_to edit_brand_path(brand.id),
                  notice: 'Unable to update as you did not assign a subcategory or left the text field blank'
    else
      @brand.update(name: params[:brand][:name])
      @subcategory.brands << @brand
      if @brand.errors.any?
        redirect_to edit_brand_path(@brand.id), notice: 'The subcategory already has a brand with the same name'
      else
        redirect_to edit_brand_path(@brand.id), notice: 'Updated Successfully'
      end
    end
  end

  def destroy
    subcatid = @brand.subcategory.id
    catid = @brand.subcategory.category.id
    @brand.destroy
    redirect_to brands_path, notice: 'Successfully Deleted'
  end

  def subcategory
    @target = params[:target]
    respond_to(&:turbo_stream)
  end

  private

  def set_brand
    @brand = Brand.find_by(id: params[:id])
  end

  def set_subcategory
    @subcategory = Subcategory.find_by(id: params[:subcategory])
  end
end
