class CoursesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @courses = Course.all
  end

  def show
    @course = Course.includes(:assignments, :lessons).find(params[:id])
  end

  def copy_course
    @course = Course.includes(:assignments, :lessons).find(params[:course_id])
    # new_course = create_course(dup)

    job =  Delayed::Job.enqueue CopyCourseJob.new(@course)
    # CopyCourseJob.perform_later(@course)

    respond_to do |format|
      format.html  { job }
      format.json  { render :json => job }
    end
  end
end
