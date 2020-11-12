class ItemsImportsController < ApplicationController
  before_action :set_items_import, only: [:show, :edit, :update, :destroy]

  # GET /items_imports
  # GET /items_imports.json
  def index
    @items_imports = ItemsImport.all
  end

  # GET /items_imports/1
  # GET /items_imports/1.json
  def show
  end

  # GET /items_imports/new
  def new
    @items_import = ItemsImport.new
  end

  # GET /items_imports/1/edit
  def edit
  end

  # POST /items_imports
  # POST /items_imports.json
  def create
    @items_import = ItemsImport.new(items_import_params)

    respond_to do |format|
      if @items_import.save
        format.html { redirect_to @items_import, notice: 'Items import was successfully created.' }
        format.json { render :show, status: :created, location: @items_import }
      else
        format.html { render :new }
        format.json { render json: @items_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_imports/1
  # PATCH/PUT /items_imports/1.json
  def update
    respond_to do |format|
      if @items_import.update(items_import_params)
        format.html { redirect_to @items_import, notice: 'Items import was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_import }
      else
        format.html { render :edit }
        format.json { render json: @items_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_imports/1
  # DELETE /items_imports/1.json
  def destroy
    @items_import.destroy
    respond_to do |format|
      format.html { redirect_to items_imports_url, notice: 'Items import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_import
      @items_import = ItemsImport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def items_import_params
      # params.require(:items_import).permit(:file_name, :uploaded_by, :uploaded_at, :status)
      params.fetch(:items_import, {}).permit(:file_name, :uploaded_by, :uploaded_at, :status)
    end
end
