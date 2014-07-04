class AddSocialToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :twitter_username, :string
    add_column :resumes, :facebook_url, :string
  end
end
