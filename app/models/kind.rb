class Kind < ActiveRecord::Base
  attr_accessible :name
  has_many :statuses, class_name: 'Status'
end
