class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_materials, only: [:index, :show, :new, :edit, :create, :update]
  before_action :find_levels, only:    [:index, :show, :new, :edit, :create, :level]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course         = current_user.courses.build(course_params)
    @course.author  = current_user.full_name
    @course.memo    = current_user.memo

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    #enable material
    def find_materials
      @materials = Material.all
    end

    #enable level
    def find_levels
      @levels = Level.all
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:title, :content, :level_id, :material_id, :author, :user_id, :slug)
    end
end
