class Api::V1::PublicationsController < Api::V1::BaseController
  before_action :set_publication, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /publications
  def index
    @publications = Publication.all

    render json: @publications
  end

  # GET /publications/1
  def show
    render json: @publication
  end

  # POST /publications
  def create
    @publication = Publication.new(publication_params)    
    @publication.user_id=current_user.id

    if @publication.save
      render json: @publication, status: :created
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      render json: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publication_params
      params.permit(:title, :description)
    end
end
