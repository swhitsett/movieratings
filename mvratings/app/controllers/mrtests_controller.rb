class MrtestsController < ApplicationController
  before_action :set_mrtest, only: [:show, :edit, :update, :destroy]

  # GET /mrtests
  # GET /mrtests.json
  def index
    @mrtests = Mrtest.all
  end

  # GET /mrtests/1
  # GET /mrtests/1.json
  def show
  end

  # GET /mrtests/new
  def new
    @mrtest = Mrtest.new
  end

  # GET /mrtests/1/edit
  def edit
  end

  # POST /mrtests
  # POST /mrtests.json
  def create
    @mrtest = Mrtest.new(mrtest_params)

    respond_to do |format|
      if @mrtest.save
        format.html { redirect_to @mrtest, notice: 'Mrtest was successfully created.' }
        format.json { render :show, status: :created, location: @mrtest }
      else
        format.html { render :new }
        format.json { render json: @mrtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mrtests/1
  # PATCH/PUT /mrtests/1.json
  def update
    respond_to do |format|
      if @mrtest.update(mrtest_params)
        format.html { redirect_to @mrtest, notice: 'Mrtest was successfully updated.' }
        format.json { render :show, status: :ok, location: @mrtest }
      else
        format.html { render :edit }
        format.json { render json: @mrtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mrtests/1
  # DELETE /mrtests/1.json
  def destroy
    @mrtest.destroy
    respond_to do |format|
      format.html { redirect_to mrtests_url, notice: 'Mrtest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mrtest
      @mrtest = Mrtest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mrtest_params
      params.require(:mrtest).permit(:first)
    end
end
