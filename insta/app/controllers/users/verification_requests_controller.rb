class Users::VerificationRequestsController < Users::ApplicationController
  before_action :set_verification_request, only: [:show]

  def index
    @verification_requests = VerificationRequest.includes(:account, :verifier).order(created_at: :desc)
  end

  def show
  end

  def create
    @verification_request = current_user.account.build_verification_request(verification_request_params)

    if @verification_request.save
      render json: { message: "Verification request submitted successfully", id: @verification_request.id }, status: :created
    else
      render json: { errors: @verification_request.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_verification_request
    @verification_request = VerificationRequest.find(params[:id])
  end

  def verification_request_params
    params.fetch(:verification_request).permit(:document)
  end
end
