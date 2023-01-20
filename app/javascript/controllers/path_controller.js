import { Controller } from "stimulus";

export default class extends Controller {
   static targets = ["pathway"]

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

