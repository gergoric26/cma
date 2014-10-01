class Contact < ActiveRecord::Base
	has_many :meetings
	belongs_to :user
end
