class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.string :company
      t.string :position
      t.string :start_duration
      t.string :end_duration
      t.string :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
