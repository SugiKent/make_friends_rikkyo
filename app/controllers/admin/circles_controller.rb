class Admin::CirclesController < AdminController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]

  # GET /admin/circles
  # GET /admin/circles.json
  def index
    @circles = Circle.all
  end

  # GET /admin/circles/1
  # GET /admin/circles/1.json
  def show
  end

  # GET /admin/circles/new
  def new
    @circle = Circle.new
  end

  # GET /admin/circles/1/edit
  def edit
  end

  # POST /admin/circles
  # POST /admin/circles.json
  def create
    @circle = Circle.new(circle_params)

    respond_to do |format|
      if @circle.save
        format.html { redirect_to admin_circles_path, notice: 'Circle was successfully created.' }
        format.json { render :show, status: :created, location: @circle }
      else
        format.html { render :new }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/circles/1
  # PATCH/PUT /admin/circles/1.json
  def update
    respond_to do |format|
      if @circle.update(circle_params)
        format.html { redirect_to admin_circles_path, notice: 'Circle was successfully updated.' }
        format.json { render :show, status: :ok, location: @circle }
      else
        format.html { render :edit }
        format.json { render json: @circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/circles/1
  # DELETE /admin/circles/1.json
  def destroy
    @circle.destroy
    respond_to do |format|
      format.html { redirect_to admin_circles_url, notice: 'Circle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(:name, :category)
    end
end
