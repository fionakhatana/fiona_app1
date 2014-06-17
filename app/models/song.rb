class Song < ActiveRecord::Base
   belongs_to :Movie
   has_many :ratings, as: :rateable
#   validates :movie_id,presence:true
   
end
