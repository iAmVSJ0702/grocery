import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brands"
export default class extends Controller {
  connect() {
    console.log('brand connect')
  }

  initialize() {
    this.element.setAttribute("data-action", "change->brands#loadSubcategoryBrands")
  }

  loadSubcategoryBrands(){
    const selectedSubcategory = this.element.options[this.element.selectedIndex].value
    this.url = `/items/fetch_subcategory_brands?subcategory_code=${selectedSubcategory}`
    fetch(this.url,{
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html=> Turbo.renderStreamMessage(html))
  }
}
