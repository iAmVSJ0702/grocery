import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  connect() {
    console.log('connected!!')
  }

  initialize() {
    this.element.setAttribute("data-action", "change->categories#loadCategorySubcategories")
  }

  loadCategorySubcategories(){
    const selectedCategory = this.element.options[this.element.selectedIndex].value
  }
}
