class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.datetime :start_date
      t.datetime :deadline
      t.references :course
    end
  end
end
