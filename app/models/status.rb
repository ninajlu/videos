class Status < ActiveRecord::Base
  belongs_to :video, class_name: 'Video'
  attr_accessible :comment, :completed, :time_comp, :type, :video_id
  validates :video_id, presence: true
	def video_name
		video.name if video
	end
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
end