class SubcategoriesController < ApplicationController
  def index
    @category = Category.all
  	@allSubCat = Category.find_by(id: params[:cat_id]).subcategories.all
  	respond_to do |format|
  		format.json { render :json => @allSubCat }
  	end 
  end

  def subcategory
    @target = params[:target]
    @subcategory = Category.find_by(id: params[:cat_id]).subcategories.all
  	respond_to do |format|
  		format.turbo_stream
  	end 
  end
  
  def new
    unless params[:category][:id]==""
      @newSubCat = Subcategory.new
      @catName =   Category.find_by(id: params[:category][:id])
      @subCatAll = @catName.subcategories.all 
      @catname = @catName[:name]
    else
      redirect_to admin_index_path
    end
  end

  def edit
    @subCat = Subcategory.find_by(id: params[:id])
  end

  def update
    newName = params[:subcategory][:name]
    @subCat = Subcategory.find_by(id: params[:id])
    newCat = Category.find_by(id: params[:category])
    @subCat.update(name: newName)
    newCat.subcategories << @subCat
    unless @subCat.errors.any?
      flash[:notice] = "Updated Successfully"
      redirect_to  action: "new" , category: {id: params[:category]}
    else
      flash[:notice] = "Not Updated: The Category might already have an subcategory with the same name / Empty Field"
      redirect_to action: "edit" 
    end
  end

  def create
    catId = params[:subcategory][:category]
    subCatName = params[:subcategory][:name]
    @cat = Category.find_by(id: catId)
    @newSubCat = @cat.subcategories.create(name: subCatName)
    if @newSubCat.save
      flash[:notice] = "Added successfully"
      redirect_to action: "new" , category: {id: catId}
    else
      flash[:notice] = "Subcategory already exist/Blank Field"
      redirect_to action: "new" , category: {id: catId}
    end
  end

  def destroy
    @delSubCat = Subcategory.find_by(id: params[:id])
    catId = @delSubCat.category.id
    @delSubCat.destroy
    redirect_to action: "new" , category: {id: catId}
  end

  def for_categoryid
    @subcategories = Subcategory.find_all_by_section_id( params[:id]).sort_by{ |k| k['name'] }
    respond_to do |format|
      format.json { render :json => @subcategories }
    end
  end
end