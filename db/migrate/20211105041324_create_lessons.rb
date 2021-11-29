class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.references :course
      t.timestamps
    end
  end
end
