class Video < ActiveRecord::Base
  belongs_to :track, class_name: 'Track'
  has_many :statuses, class_name: 'Status'
  attr_accessible :current, :track_id, :name
	def track_name
		track.name if track
	end
end
