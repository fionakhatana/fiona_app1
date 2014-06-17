class Movie < ActiveRecord::Base
   has_many :songs, dependent: :destroy
   has_many :movie_actors, dependent: :destroy
   has_many :actors, through: :movie_actors
   has_many :ratings, as: :rateable
#   validates :description, presence:true
#    validate :check_name, uniqueness:true
     validates :name, uniqueness:true
#   validates :rating, numericality:true
#   before_validation :check_ratings
#    before_save :check_caps 
    validate  :check_caps
#   after_save :check_save
#   after_update :check_update

  accepts_nested_attributes_for :songs, :movie_actors, allow_destroy: true
   def check_caps
     caps = 'A'..'Z'
     if !caps.include?(self.name[0])
       self.name = self.name.upcase  
       self.errors.add(:name,'error') 
     end
   end

   def check_update
     p "record updated"
   end
   def check_save
     p "record saved"
   end

   def check_ratings
     self.rating = 5 if rating.nil?
   end
   def check_name
    errors.add(:name, 'Change name') if name != 'Pratik'
  end
end
