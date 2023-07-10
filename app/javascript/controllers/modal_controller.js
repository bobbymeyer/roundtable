import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.parentElement.remove()
    this.element.remove()
  }

  hideModalBg() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }
}