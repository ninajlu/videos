class Status < ActiveRecord::Base
  belongs_to :video, class_name: 'Video'
  belongs_to :kind, class_name: 'Kind'
  attr_accessible :comment, :completed, :time_comp, :type, :video_id, :video, :kind_name, :kind_id, :kind
  validates :video_id, presence: true
	def video_name
		video.name if video
	end
	def kind_name
		kind.name if kind
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