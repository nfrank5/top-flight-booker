import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["paxList", "emptyPax" ]
  static values = { index: Number }


  connect() {
    fetch(this.indexValue)
  }

  addPax(){
    const template = this.emptyPaxTarget
    const clone = template.content.cloneNode(true)
    this.paxListTarget.appendChild(clone)
  }
}
