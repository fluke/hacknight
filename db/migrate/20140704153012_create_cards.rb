class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :pdf_url
      t.integer :theme
      t.string :qr_code_link
      t.string :photo
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :work_ex_position
      t.string :work_ex_company
      t.string :website_url
      t.string :phone
      t.string :email
      t.string :resume_id
      t.string :twitter_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
