class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :ratings

  def average_rating
    (self.ratings.pluck(:value).sum.to_f / self.ratings.count).round(2)
  end

end
