import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["paxList", "emptyPax" ]
  static values = { index: Number }


  connect() {
    
  }

  addPax(){
    var index = this.indexValue++
    const t = this.emptyPaxTarget
    const clone = t.content.cloneNode(true)
    //clone.querySelector("li>:nth-child(1)").setAttribute("for",`booking_passengers_attributes_${index}_name`)
    //clone.querySelector("li>:nth-child(2)").setAttribute("id",`booking_passengers_attributes_${index}_name`)
    clone.querySelector("li>:nth-child(2)").setAttribute("name",`booking[passengers_attributes][${index}][name]`)
    //clone.querySelector("li>:nth-child(3)").setAttribute("for",`booking_passengers_attributes_${index}_email`)
    //clone.querySelector("li>:nth-child(4)").setAttribute("id",`booking_passengers_attributes_${index}_email`)
    clone.querySelector("li>:nth-child(4)").setAttribute("name",`booking[passengers_attributes][${index}][email]`)
    this.paxListTarget.appendChild(clone)
  }

}
