import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "add_button" ]

  addItem(event) {
    event.preventDefault()
    let content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.add_buttonTarget.insertAdjacentHTML('beforebegin', content)
  }

  removeItem(event) {
    event.preventDefault()

    let item = event.target.closest('.nested-fields')

    if (item.dataset.newRecord === 'true') {
      item.remove()
    } else {
      item.querySelector("input[name*='_destroy']").value = 1
      item.style.display = 'none'
    }
  }
}
