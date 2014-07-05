class AddLinkedInUrlToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :linked_in_url, :string
  end
end
