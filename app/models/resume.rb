class Resume < ActiveRecord::Base
	has_one :card
	has_many :educations
	has_many :references
	has_many :skills
	has_many :work_experiences 
	has_many :extra_fields
	validates_presence_of :first_name, :email, :phone
	validates :email,
            :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "Email format is wrong." }
end
