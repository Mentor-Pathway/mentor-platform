import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"
export default class extends Controller {
   static targets = ["path"]

}

document.addEventListener("onclick", (event) => {
   var button = event.target;
   if (button.classList.contains("tag-button")) {
      var tag = button.innerText.toLowerCase();
      var pathways = document.querySelectorAll(`[data-tag='${tag}']`);
      var allpathways = document.querySelectorAll('.pathway');
      allpathways.forEach(pathway => pathway.style.display = 'none');
      pathways.forEach(pathway => pathway.style.display = 'block');
   }
});
