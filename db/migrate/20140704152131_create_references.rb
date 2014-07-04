class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :linked_in_url
      t.string :twitter_url
      t.string :description
      t.string :resume_id

      t.timestamps
    end
  end
end
