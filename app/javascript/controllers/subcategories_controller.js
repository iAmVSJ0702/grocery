import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="categories"
export default class extends Controller {
  connect() {
  }

  initialize() {
    this.element.setAttribute("data-action", "change->subcategories#loadCategorySubcategories")
  }

  loadCategorySubcategories(){
    const selectedCategory = this.element.options[this.element.selectedIndex].value
    this.url = `/items/fetch_category_subcategories?category_code=${selectedCategory}`
    fetch(this.url,{
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html=> Turbo.renderStreamMessage(html))
    
  }
}
