import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  clear() {
    console.log("clearing form");
    this.element.reset();
  }
}

