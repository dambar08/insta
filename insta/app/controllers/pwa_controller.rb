class PwaController < ApplicationController
  skip_forgery_protection

  def service_worker
    respond_to do |format|
      format.js { render template: "pwa/service-worker", layout: false }
    end
  end

  def manifest
    respond_to do |format|
      format.json { render template: "pwa/manifest", layout: false }
    end
  end
end
