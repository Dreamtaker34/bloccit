# == Schema Information
#
# Table name: sponsoredposts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sponsoredpost < ActiveRecord::Base
  belongs_to :topic
end
