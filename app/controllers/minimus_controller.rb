require 'securerandom'
class MinimusController < ApplicationController
  before_action :set_minimu, only: [:show, :edit, :update, :destroy]

  # GET /minimus
  # GET /minimus.json
  def index
    @minimus = Minimu.all
  end

  # GET /minimus/1
  # GET /minimus/1.json
  def show
    @minimu = Minimu.find(params[:id])
  end

  def sendme

    minimu = Minimu.all.select{ |item| item.short_url.include?(params[:sid]) }.first
    redirect_to minimu.long_url unless minimu.nil?


  end

  # GET /minimus/new
  def new
    @minimu = Minimu.new
  end

  # GET /minimus/1/edit
  def edit
  end

  # POST /minimus
  # POST /minimus.json
  def create
    @minimu = Minimu.new # (minimu_params)

    unique_id = SecureRandom.uuid.split('-').first

    @minimu.short_url = "#{request.protocol}#{request.host_with_port}/redirect/#{unique_id}"
    @minimu.long_url = minimu_params[:long_url]
    respond_to do |format|
      if @minimu.save
        format.html { redirect_to @minimu, notice: 'Minimu was successfully created.' }
        format.json { render :show, status: :created, location: @minimu }
      else
        format.html { render :new }
        format.json { render json: @minimu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minimus/1
  # PATCH/PUT /minimus/1.json
  def update
    respond_to do |format|
      if @minimu.update(minimu_params)
        format.html { redirect_to @minimu, notice: 'Minimu was successfully updated.' }
        format.json { render :show, status: :ok, location: @minimu }
      else
        format.html { render :edit }
        format.json { render json: @minimu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minimus/1
  # DELETE /minimus/1.json
  def destroy
    @minimu.destroy
    respond_to do |format|
      format.html { redirect_to minimus_url, notice: 'Minimu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minimu
      @minimu = Minimu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minimu_params
      params.require(:minimu).permit(:short_url, :long_url)
    end
end
