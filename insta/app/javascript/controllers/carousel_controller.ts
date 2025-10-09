import { Controller } from "@hotwired/stimulus"
import { SwiperOptions } from "swiper/types"
import Swiper from "swiper"

// Connects to data-controller="carousel"
export default class extends Controller {
  declare swiper: Swiper
  declare optionsValue: SwiperOptions

  static values = {
    options: Object,
  }

  connect(): void {
    if(this.element instanceof HTMLElement) {
      this.swiper = new Swiper(this.element, {
        ...this.defaultOptions,
        ...this.optionsValue,
      })
    }
  }

  disconnect(): void {
    this.swiper.destroy()
    this.swiper = undefined
  }

  get defaultOptions(): SwiperOptions {
    return {}
  }
}
