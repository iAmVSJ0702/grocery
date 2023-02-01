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
    this.url = `/admin/fetch_category_subcategories?category_code=${selectedCategory}`
    fetch(this.url,{
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html=> Turbo.renderStreamMessage(html))
    
  }
}
