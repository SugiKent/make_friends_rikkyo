class Admin::FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET /admin/faculties
  # GET /admin/faculties.json
  def index
    @faculties = Faculty.all
  end

  # GET /admin/faculties/1
  # GET /admin/faculties/1.json
  def show
  end

  # GET /admin/faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /admin/faculties/1/edit
  def edit
  end

  # POST /admin/faculties
  # POST /admin/faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to admin_faculties_path, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/faculties/1
  # PATCH/PUT /admin/faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to admin_faculties_path, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/faculties/1
  # DELETE /admin/faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to admin_faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:faculty_name)
    end
end
