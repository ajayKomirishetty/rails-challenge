def create_course(name: nil, num_lessons:, num_assignments:)
  course = Course.create!(
    name: name || Faker::Educator.course_name,
    description: Faker::Lorem.paragraph
  )
  num_lessons.times { |i| course.lessons.create!(name: "Lesson #{i + 1}") }
  num_assignments.times { |i| course.assignments.create!(name: "Assignment #{i + 1}") }
end

puts 'Creating courses ...'
10.times { create_course(num_lessons: rand(10) + 1, num_assignments: rand(10) + 1) }

puts 'Creating big course ...'
create_course(name: 'Big Course', num_lessons: 2000, num_assignments: 3000)

puts 'Done.'
