import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pathway"
export default class extends Controller {
   static targets = ["path"]

   connect() {
      console.log("connected to the path stimulus controller")
   }

   change(event) {
      const selectedDifficulty = (event.target.value).toLowerCase();
      this.pathTargets.forEach(pathway => {
         if (pathway.attributes.difficulty.value === selectedDifficulty) {
            pathway.style.display = "block"
         } else {
            pathway.style.display = "none"
         }
      })
   }
}

