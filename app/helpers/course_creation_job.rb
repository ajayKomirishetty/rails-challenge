 CourseCreationJob =  Struct.new(:course) do
    def perform
        new_course = course.deep_dup
        new_course.save!
    end
  end

    