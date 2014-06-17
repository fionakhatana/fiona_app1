class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :rateable, polymorphic: true
  validates :stars, numericality:true
  validates :user_id, presence:true 
  validate :one_five
  validates_associated :user
  def one_five
    if !(0..5).include?self.stars
    self.errors.add(:stars,'wrong no of stars')
    end
  end

end
