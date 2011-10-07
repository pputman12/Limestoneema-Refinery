class Hazard < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :category, :content]

  validates :title, :presence => true, :uniqueness => true
  
end
