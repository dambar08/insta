import { Application } from "@hotwired/stimulus"
import Notification from 'stimulus-notification'

const application = Application.start()
application.register('notification', Notification)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
