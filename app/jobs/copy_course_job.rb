class CopyCourseJob < ProgressJob::Base

  def initialize(course)
    @course = course
  end

  def perform
    update_progress(step: 1) 
    #  new_course = @course.deep_dup
    # new_course = Marshal.load(Marshal.dump(@course))
    # new_course =  DeepClone.clone @course
    new_course = Course.new(
      name: @course.name,
      description: @course.description
    )
    # new_course = @course.clone
    new_course.lessons << @course.lessons.collect { |c| c.deep_dup}
    new_course.assignments << @course.assignments.collect { |c| c.deep_dup}
    # new_course = @course.clone_deep
    update_progress(step: 50)
    new_course.id = Course.last.id + 1 
    new_course.save!
    update_progress(step: 100) 
  end
end