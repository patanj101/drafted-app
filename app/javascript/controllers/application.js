import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import 'alpine-turbo-drive-adapter'
import Alpine from 'alpinejs'
import persist from "@alpinejs/persist";

Alpine.plugin(persist)
window.Alpine = Alpine
Alpine.start()