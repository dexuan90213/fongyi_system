import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "add_button" ]

  addItem(event) {
    event.preventDefault()
    let content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.add_buttonTarget.insertAdjacentHTML('beforebegin', content)
  }
}
