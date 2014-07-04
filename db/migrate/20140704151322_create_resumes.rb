class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :website
      t.integer :theme
      t.string :url
      t.integer :view_count

      t.timestamps
    end
  end
end
