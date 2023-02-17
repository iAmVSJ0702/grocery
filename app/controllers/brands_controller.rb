class BrandsController < ApplicationController
  def index
  	@allbrands = Subcategory.find_by(id: params[:cat_id]).brands.all
  	respond_to do |format|
  		format.json { render :json => @allbrands }
  	end
  end

  def new
    unless params[:category] == "" || params[:subcategory] == "" 
      @newBrand = Brand.new
      @cat = Category.find_by(id: params[:category])
      @subCat = Subcategory.find_by(id: params[:subcategory])
      @subCatName = @subCat.name
      @brands = @subCat.brands.all
    else
       redirect_to admin_index_path , notice: "Please enter parameters"
    end
  end

  def edit
    @brand= Brand.find_by(id: params[:id])
    @cat = @brand.subcategory.category
    @subcat = @cat.subcategories.all
  end

  def update
    brand = Brand.find_by(id: params[:id])
    if params[:subcategory]=="" || params[:brand][:name]==""
      redirect_to edit_brand_path(brand.id) , notice: "Unable to update as you did not assign a subcategory or left the text field blank"
    else
      brand.update(name: params[:brand][:name])
      subCat = Subcategory.find_by(id: params[:subcategory])
      subCat.brands << brand
      if brand.errors.any?
        redirect_to edit_brand_path(brand.id) , notice: "The subcategory already has a brand with the same name"
      else
        redirect_to edit_brand_path(brand.id) , notice: "Updated Successfully"
      end
    end
  end

  def create
    subCatId = params[:brand][:subcategory]
    @subCat = Subcategory.find_by(id: subCatId)
    catId = @subCat.category.id
    brand = params[:brand][:name]
    @newBrand = @subCat.brands.create(name: brand)
    if @newBrand.save
      flash[:notice] = "Brand added"
      redirect_to action: "new" , subcategory: subCatId , category: catId
    else
      flash[:notice] = "Brands already exist/Empty field"
      redirect_to action: "new" , subcategory: subCatId , category: catId
    end
  end

  def destroy
    brandId = params[:id]
    @deleteBrand = Brand.find_by(id: brandId)
    subcatid = @deleteBrand.subcategory.id
    catid = @deleteBrand.subcategory.category.id
    @deleteBrand.destroy
    redirect_to action: "new" , subcategory: subcatid , category: catid
  end

  def subcategory
    @target = params[:target]
    @subcategory = Subcategory.find_by(id: params[:subcategory]).invert
    respond_to do |format|
      format.turbo_stream
    end
  end
end