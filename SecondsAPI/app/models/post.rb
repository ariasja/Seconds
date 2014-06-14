class Post < ActiveRecord::Base
	validates :caption, length: { maximum: 140 }

	has_one :video
	belongs_to :user
end
