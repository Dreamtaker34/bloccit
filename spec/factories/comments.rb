# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :string
#

include RandomData

FactoryGirl.define do
  factory :comment do
    body RandomData.random_paragraph
    topic
    post
    user
  end
end
