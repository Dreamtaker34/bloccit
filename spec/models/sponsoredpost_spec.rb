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

require 'rails_helper'
include RandomData

RSpec.describe Sponsoredpost, type: :model do
#  let(:sponsoredpost) {Sponsoredpost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsoredpost) { topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }

  it { should belong_to(:topic) }

  describe "attributes" do
   it "should respond to title" do
     expect(sponsoredpost).to respond_to(:title)
   end

   it "should respond to body" do
     expect(sponsoredpost).to respond_to(:body)
   end

   it "should respond to price" do
     expect(sponsoredpost).to respond_to(:price)
   end
 end
end
