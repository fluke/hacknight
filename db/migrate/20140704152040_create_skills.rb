class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
