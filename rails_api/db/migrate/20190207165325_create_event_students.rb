class CreateEventStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :event_students do |t|
      t.integer :student_id
      t.integer :event_id

      t.timestamps
    end
  end
end
