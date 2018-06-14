class Api::V1::CupomsController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:create, :reset_password]
  before_action :set_cupom, only: [:show, :update, :destroy]

  # GET /cupoms
  def index
    @cupoms = Cupom.all

    render json: @cupoms
  end

  # GET /cupoms/1
  def show
    render json: @cupom
  end

  # POST /cupoms
  def create
    @cupom = Cupom.new(cupom_params)
    if @cupom.save
      render json: @cupom, status: :created, location: @cupom
    else
      render json: @cupom.errors, status: :unprocessable_entity
    end
  end

 

  # PATCH/PUT /cupoms/1
  def update
    if @cupom.update(cupom_params)
      render json: @cupom
    else
      render json: @cupom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cupoms/1
  def destroy
    @cupom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cupom
      @cupom = Cupom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cupom_params
      params.require(:cupom).permit(:name, :score,:body)
    end
end
