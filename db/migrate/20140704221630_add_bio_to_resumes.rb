class AddBioToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :bio, :string
  end
end
