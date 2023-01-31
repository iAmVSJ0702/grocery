class CategoriesController < ApplicationController

  def new
    @newCat = Category.new
    @allCat = Category.all
  end

  def create
  	@createCat = Category.new(category_params)
  	if @createCat.save
  		redirect_to new_category_path , notice: "Successfully added category"
  	else
  		redirect_to new_category_path , notice: "Category Already exists/Blank Field"
  	end 
  end

  def edit
    @cat = Category.find_by(id: params[:id])
  end

  def update 
    newCat = params[:category][:name]
    catId = params[:id]
    cat = Category.find_by(id: catId)
    cat.update name: newCat
    redirect_to new_category_path
  end

  def show
    @cat = Category.find_by(id: params[:id])
  end

  def destroy
  	@delCat = Category.find_by(id: params[:id])
  	@delCat.destroy
  	redirect_to new_category_path
  end


  private
  	def category_params
  		params.require(:category).permit(:name)
  	end
end

