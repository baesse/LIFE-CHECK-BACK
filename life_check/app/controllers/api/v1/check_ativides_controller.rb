class Api::V1::CheckAtividesController < Api::V1::BaseController
  before_action :set_check_ativide, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[create reset_password]
  # GET /check_ativides
  def index
    
    if current_user.age <= 30
      @check_ativides = CheckAtivide.where(age_user: 0..30)
    end
    if current_user.age > 30 && current_user.age < 60
      @check_ativides = CheckAtivide.where(age_user: 30..60)
    end
    if current_user.age > 30
      @check_ativides = CheckAtivide.where(age_user: 60..100)
    end

    render json: @check_ativides
  end

  # GET /check_ativides/1
  def show
    render json: @check_ativide
  end

  # POST /check_ativides
  def create
    @check_ativide = CheckAtivide.new(check_ativide_params)

    if @check_ativide.save
      render json: @check_ativide, status: :created, location: @check_ativide
    else
      render json: @check_ativide.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /check_ativides/1
  def update
    if @check_ativide.update(check_ativide_params)
      render json: @check_ativide
    else
      render json: @check_ativide.errors, status: :unprocessable_entity
    end
  end

  def checked_list
    if params[:check_id].present?
      check = CheckAtivide.find(params[:check_id])
      current_user.score += check.score
      current_user.save
    end
  end

  # DELETE /check_ativides/1
  def destroy
    @check_ativide.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_check_ativide
    @check_ativide = CheckAtivide.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def check_ativide_params
    params.require(:check_ativide).permit(:body, :user_id, :age_user, :title,:score)
  end
end
