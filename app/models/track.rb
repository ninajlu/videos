class Track < ActiveRecord::Base
  attr_accessible :name, :videos
  validates :name, presence: true
  has_many :videos, class_name: 'Video'
end
