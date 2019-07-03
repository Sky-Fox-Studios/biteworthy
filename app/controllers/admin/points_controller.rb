class Admin::PointsController < AdminController
  before_action :only_nom
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /points
  # GET /points.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: PointDatatable.new(params, view_context: view_context) }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end
end
