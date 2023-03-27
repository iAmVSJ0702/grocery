# frozen_string_literal: true

# This is ItemsController
class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :ensure_signin
  skip_before_action :ensure_admin

  def index
    @category_id = params[:category]
    @subcategory_id = params[:subcategory]
    @brand_id = params[:brand]
    @brand_id_alt = params[:brand1]

    @categories = Category.all
    @brands = Brand.all
    @all_items = Item.all.order(id: :desc) if @category_id.nil? || @category_id == ''

    unless @category_id.nil? || @category_id == ''
      @subcategories = Category.find(@category_id).subcategories.all
      @category = Category.find(@category_id)
      @all_items = @category.items
      unless @subcategory_id.nil? || @subcategory_id == ''
        @brands = Subcategory.find(@subcategory_id).brands.all
        @subcategory = @category.subcategories.find_by(id: @subcategory_id)
      end
      @all_items = @subcategory.items unless @subcategory.nil?
      @brand = @subcategory.brands.find_by(id: @brand_id) unless @brand_id.nil? || @brand_id == '' || @subcategory.nil?
      @all_items = @brand.items unless @brand.nil?
    end
    @user = User.find_by(id: session[:user_id])
    @brand1 = Brand.find_by(id: @brand_id_alt)
    @all_items = @brand1.items unless @brand1.nil?
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def new
    @new_item = Item.new
    @brand = Brand.find_by(id: params[:brand])
  end

  def create
    brand_id = params[:brand]
    @brand = Brand.find(params[:brand])
    item = params[:title]
    @new_item = @brand.items.create(title: params[:title], price: params[:price], description: params[:description],
                                    avatar: params[:avatar])
    if @new_item.save
      redirect_to item_path(@new_item), notice: 'Successfullt added item'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit; end

  def update
    if params[:category] == '' || params[:subcategory] == '' || params[:brand] == ''
      redirect_to edit_item_path(params[:id]), notice: 'Category/Subcategory/Brand Cannot be empty'
    else
      @@category = Category.find_by(id: params[:category])
      @subcategory = Subcategory.find_by(id: params[:subcategory])
      @brand = Brand.find_by(id: params[:brand])

      item_name = params[:item][:title]
      item_price = params[:item][:price]
      item_description = params[:item][:description]

      @avatar = params[:item][:avatar]
      if item_name == '' || item_price == '' || item_description == ''
        redirect_to edit_item_path(params[:id]), notice: 'Fields Cannot be empty'
      else
        @old_brand = @my_item.getbrand
        @my_item.update(title: item_name, price: item_price, description: item_description)
        @my_item.update(avatar: @avatar) unless @avatar.nil?
        @brand.items << @my_item
        redirect_to root_path
      end
    end
  end

  def destroy
    @my_item.destroy
    redirect_to items_path, notice: 'Successfully Deleted'
  end

  def fetch_category_subcategories
    category = Category.find_by(id: params[:subcategory_code])
    return if category.nil?

    @subcategories = category.subcategories.all
  end

  def fetch_subcategory_brands
    subcategory = Subcategory.find_by(id: params[:brand_code])
    return if subcategory.nil?

    @brands = subcategory.brands.all
  end

  private

  def set_item
    @my_item = Item.find(params[:id])
  end
end
