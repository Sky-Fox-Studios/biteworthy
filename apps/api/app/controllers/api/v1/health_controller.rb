module Api
  module V1
    # GET /api/v1/health — returns service availability status.
    #
    # Checks whether the assistant (Anthropic API) is configured.
    # Used by empty states and CTAs to decide whether to promise photo scanning.
    class HealthController < BaseController
      skip_before_action :authenticate_user!, only: [ :show ]

      def show
        render json: {
          assistant_configured: assistant_configured?
        }
      end

      private

      def assistant_configured?
        ENV["ANTHROPIC_API_KEY"].present? && !ENV["ANTHROPIC_API_KEY"].empty?
      end
    end
  end
end
