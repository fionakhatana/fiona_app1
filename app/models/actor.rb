class Actor < ActiveRecord::Base
  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors
#  validates :name,presence:true,uniqueness:true
end
