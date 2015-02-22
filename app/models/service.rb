class Service < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments, dependent: :destroy

  def average_rating
    if self.comments.first
      ratings = self.comments.map(&:rating).compact
      if ratings.first
        sum = ratings.inject(:+)
        sum / ratings.length.to_f
      else
        0
      end
    else
      0
    end
  end
end
