class Movie < ActiveRecord::Base
  belongs_to :user
  validates :title, :rating, presence: true
  
end