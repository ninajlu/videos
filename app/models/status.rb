class Status < ActiveRecord::Base
  belongs_to :video, class_name: 'Video'
  attr_accessible :comment, :completed, :time_comp, :type, :video_id
  validates :video_id, presence: true
	def video_name
		video.name if video
	end
end