class ReferencelistsController < ApplicationController
  before_action :set_referencelist, only: [:show, :edit, :update, :destroy]

  # GET /referencelists
  # GET /referencelists.json
  def index
    @referencelists = Referencelist.all
  end

  # GET /referencelists/1
  # GET /referencelists/1.json
  def show
  end

  # GET /referencelists/new
  def new
    @users = User.all
    @referencelist = Referencelist.new
  end

  # GET /referencelists/1/edit
  def edit
  end

  # POST /referencelists
  # POST /referencelists.json
  def create
    @referencelist = Referencelist.new(referencelist_params)

    respond_to do |format|
      if @referencelist.save
        format.html { redirect_to @referencelist, notice: 'Referencelist was successfully created.' }
        format.json { render :show, status: :created, location: @referencelist }
      else
        format.html { render :new }
        format.json { render json: @referencelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencelists/1
  # PATCH/PUT /referencelists/1.json
  def update
    respond_to do |format|
      if @referencelist.update(referencelist_params)
        format.html { redirect_to @referencelist, notice: 'Referencelist was successfully updated.' }
        format.json { render :show, status: :ok, location: @referencelist }
      else
        format.html { render :edit }
        format.json { render json: @referencelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencelists/1
  # DELETE /referencelists/1.json
  def destroy
    @referencelist.destroy
    respond_to do |format|
      format.html { redirect_to referencelists_url, notice: 'Referencelist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencelist
      @referencelist = Referencelist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencelist_params
      params.require(:referencelist).permit(:user_id, :name)
    end
end
