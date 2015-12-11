# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  severity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    return Rating.none if rating_string.blank?
    Rating.find_or_create_by(severity: rating_string.to_i)
  end
end
