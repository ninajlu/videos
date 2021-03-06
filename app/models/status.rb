class Status < ActiveRecord::Base
  belongs_to :video, class_name: 'Video'
  belongs_to :kind, class_name: 'Kind'
  attr_accessible :comment, :completed, :time_comp, :type, :video_id, :video, :kind_name, :kind_id, :kind, :progress
  #validates :video_id, presence: true
	def video_name
		video.name if video
	end
	def kind_name
		kind.name if kind
	end
	before_update :update_time_comp
	after_save :call_video

def self.select_options
  descendants.map{ |c| c.to_s }.sort
end
	def self.inherited(child)
  child.instance_eval do
    def model_name
      Status.model_name
    end
  end
  super
	end

	def call_video
		self.video.update_complete
	end
	def update_time_comp
		if self.progress_changed? && self.progress=="DONE" then
			self.completed=true
		elsif self.progress_changed? && self.progress!="DONE" then
			self.completed=false
		end
		if self.completed_changed? && self.completed==true then
			self.time_comp=Time.now
			self.progress="DONE"
			
		end
		if self.completed_changed? && self.completed==false then
			self.time_comp=nil
			if self.progress=="DONE" then
				self.progress=""
			end
		end
	end
	def update_complete
		self.completed=true
		self.progress="DONE"
		self.save!
	end
	def update_incomplete
		self.completed=false
		self.progress=""
		self.save!
	end

end