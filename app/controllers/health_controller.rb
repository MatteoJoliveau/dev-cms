class HealthController < ActionController::API
  def index
    render json: { status: 200, message: :ok }
  end
end