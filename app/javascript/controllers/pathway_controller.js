import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pathway"
export default class extends Controller {
   connect() {
      console.log("connected to the path stimulus controller")
    }

   change(event) {
      var selectedDifficulty = event.target.value
      this.pathwayTargets.forEach(pathway => {
         if (pathway.getAttribute("data-difficulty") === selectedDifficulty) {
            pathway.style.display = "block"
         } else {
            pathway.style.display = "none"
         }
      })
   }
}

