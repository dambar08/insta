class Admins::VerificationRequestsController < Admins::ApplicationController
  before_action :set_verification_request, only: [:show, :review, :approve, :reject]

  def index
    @verification_requests = VerificationRequest.includes(:account, :verifier).order(created_at: :desc)
  end

  def show
  end

  def review
    transition!(:review)
  end

  def approve
    transition!(:approve, verifier: current_admin)
  end

  def reject
    transition!(:reject, verifier: current_admin)
  end

  private

  # Helper for transitions
  def transition!(event, extra_attrs = {})
    if @verification_request.respond_to?(event) && @verification_request.send(:"#{event}_transition")
      if @verification_request.send(:"#{event}!", extra_attrs)
        render json: { message: "Status updated to #{@verification_request.status}" }, status: :ok
      else
        render json: { errors: @verification_request.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Invalid transition" }, status: :unprocessable_entity
    end
  end
end
