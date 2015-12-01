# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let (:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
  end

end
