import { Application } from "@hotwired/stimulus"
import Notification from 'stimulus-notification'
import PasswordVisibility from 'stimulus-password-visibility'
import "@primer/view-components"

const application = Application.start()
application.register('notification', Notification)
application.register('password-visibility', PasswordVisibility)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
