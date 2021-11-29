class AddCounterCachesToLessonsAndAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :lessons_count, :integer, default: 0
    add_column :courses, :assignments_count, :integer, default: 0
  end
end
