class CreateExtraFields < ActiveRecord::Migration
  def change
    create_table :extra_fields do |t|
      t.string :field_name
      t.string :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
