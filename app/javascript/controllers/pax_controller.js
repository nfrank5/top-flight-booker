import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["paxList", "emptyPax", "lastPax" ]
  static values = { index: Number }

  addPax(){
    this.lastPaxTarget.innerHTML = ""
    const clone = this.emptyPaxTarget.content.cloneNode(true)
    clone.querySelector("li>:nth-child(2)").setAttribute("name",`booking[passengers_attributes][${Date.now()}][name]`)
    clone.querySelector("li>:nth-child(4)").setAttribute("name",`booking[passengers_attributes][${Date.now()}][email]`)
    this.paxListTarget.appendChild(clone)
  }

  removePax(e){
    if(this.paxListTarget.childElementCount>3){
      this.paxListTarget.removeChild(e.target.parentElement)
    } else {
      this.lastPaxTarget.innerHTML = "You need at leat one passenger."
    }
  }
}
