class CreateCircuits < ActiveRecord::Migration[5.1]
  def change
    create_table :circuits do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :reps
      t.integer :sets
      t.float :weight
      t.string :unit
      t.string :note

      t.timestamps
    end
  end
end
