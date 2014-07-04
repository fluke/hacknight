class Resume < ActiveRecord::Base
	has_one :card
	has_many :educations
	accepts_nested_attributes_for :educations, :reject_if => :all_blank, :allow_destroy => true
	has_many :references
	accepts_nested_attributes_for :references, :reject_if => :all_blank, :allow_destroy => true
	has_many :skills
	accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true
	has_many :work_experiences 
	accepts_nested_attributes_for :work_experiences, :reject_if => :all_blank, :allow_destroy => true
	has_many :extra_fields
	accepts_nested_attributes_for :extra_fields, :reject_if => :all_blank, :allow_destroy => true
	belongs_to :user
	validates_presence_of :first_name, :email, :phone
	validates :email,
            :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              :message => "Email format is wrong.",
              :multiline => true }
end
