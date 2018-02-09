class AdministrativesController < ApplicationController
  before_action :set_administrative, only: [:show, :edit, :update, :destroy]

  # GET /administratives
  # GET /administratives.json
  def index
    @administratives = Administrative.all.page(params[:page])
  end

  # GET /administratives/1
  # GET /administratives/1.json
  def show
  end

  # GET /administratives/new
  def new
    @administrative = Administrative.new
    @administrative.build_user
  end

  # GET /administratives/1/edit
  def edit
  end

  # POST /administratives
  # POST /administratives.json
  def create
    @administrative = Administrative.new(administrative_params)

    respond_to do |format|
      if @administrative.save
        format.html { redirect_to @administrative, notice: 'Administrative was successfully created.' }
        format.json { render :show, status: :created, location: @administrative }
      else
        format.html { render :new }
        format.json { render json: @administrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administratives/1
  # PATCH/PUT /administratives/1.json
  def update
    respond_to do |format|
      if @administrative.update(administrative_params)
        format.html { redirect_to @administrative, notice: 'Administrative was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrative }
      else
        format.html { render :edit }
        format.json { render json: @administrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administratives/1
  # DELETE /administratives/1.json
  def destroy
    @administrative.destroy
    respond_to do |format|
      format.html { redirect_to administratives_url, notice: 'Administrative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrative
      @administrative = Administrative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrative_params
      params.require(:administrative).permit(
        :cellphone,
        user_attributes: [
          :id,
          :first_name,
          :last_name,
          :email.downcase
        ]
      )
    end

end
