class Video < ActiveRecord::Base
  belongs_to :track, class_name: 'Track'
  has_many :statuses, class_name: 'Status'
  attr_accessible :current, :track_id, :name, :existing_status_attributes
  accepts_nested_attributes_for :statuses
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
def new_status_attributes=(status_attributes)
    status_attributes.each do |attributes|
      statuses.build(attributes)
    end 
  end

  def existing_status_attributes=(status_attributes)
    statuses.reject(&:new_record?).each do |status|
      attributes = status_attributes[status.id.to_s]
      if attributes['_delete'] == '1'
        statuses.delete(status)
      else
        status.attributes = attributes
      end
    end
  end

  private

  def save_statuses
    statuses.each do |status|
      status.save!
    end
  end
end
