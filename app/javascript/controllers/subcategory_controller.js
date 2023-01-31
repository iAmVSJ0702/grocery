import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["subcategorySelect"]
  change(event) {
    let category = event.target.selectedOptions[0].value
    debugger;
    let target = this.subcategorySelectTarget.id
    get(`/subcategory/subcategory?target=${target}&category=${category}`, {
      responseKind: "turbo-stream"
    })
  }
}