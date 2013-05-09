class Video < ActiveRecord::Base
  belongs_to :track, class_name: 'Track'
  has_many :statuses, class_name: 'Status'
  attr_accessible :current, :track_id, :name
	def track_name
		track.name if track
	end

	def update_complete
		i=0
		self.statuses.each do |f|
			if f.completed==false then
				i=1
			end
		end
		if i==0 then
			self.current="Complete!"
			self.save!
		else
			self.current="Incomplete"
			self.save!
		end
	end
end
