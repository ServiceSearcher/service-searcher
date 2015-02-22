class Service < ActiveRecord::Base
  validates_presence_of :name
  has_many :comments, dependent: :destroy

  def average_rating
    if self.comments.first
      sum = self.comments.map(&:rating).inject(:+)
      sum / self.comments.length.to_f
    else
      0
    end
  end
end
