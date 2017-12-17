class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
   
  

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.search(params[:search])
    @courses = Course.all.order(:cached_weighted_subscribe_score => :desc)
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'courses/reporte', pdf: 'Reporte'}
  end


  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def current_author
  current_user.author || Author.create(user: current_user)
end
  

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.author = current_author

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
  @course.upvote_from current_user
  redirect_to courses_path
end

def downvote
    @course.downvote_from current_user
  redirect_to courses_path
  end


  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:titre, :matiere, :fac, :annee, :pdf)
    end

end

end
