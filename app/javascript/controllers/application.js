import { Application } from "@hotwired/stimulus";
import PathController from ".app/javascript/controllers/path_controller.js"

const application = Application.start();
application.register("pathways", PathController)

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

