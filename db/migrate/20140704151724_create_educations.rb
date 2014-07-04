class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :college
      t.string :degree
      t.string :start_duration
      t.string :end_duration
      t.string :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
