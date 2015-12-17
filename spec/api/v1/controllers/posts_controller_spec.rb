require 'rails_helper'
include RandomData

 RSpec.describe Api::V1::PostsController, type: :controller do
   let(:my_user) { create(:user) }
   let(:my_topic) { create(:topic) }
   let(:my_post) { create(:post, topic: my_topic, user: my_user) }
   let(:my_comment) { Comment.create!(body: RandomData.random_paragraph, post: my_post, user: my_user) }


   context "unauthenticated user" do

     it "GET show returns http success" do
       get :show, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it "GET show posts comments" do
       get :show, id: my_post.id
       response_hash = JSON.parse response.body
       expect(response_hash['comments']).to_not be_nil
     end

     it "PUT update returns http unauthenticated" do
       put :update, id: my_post.id, post: {title: "Post Name", body: "Post body to be updated"}
       expect(response).to have_http_status(401)
     end

     it "POST create returns http unauthenticated" do
       post :create, topic_id: my_topic.id, post: {title: "Post Name", body: "Post body to be created"}
       expect(response).to have_http_status(401)
     end

    #  it "DELETE destroy returns http unauthenticated" do
    #    delete :destroy, id: my_post.id
    #    expect(response).to have_http_status(401)
    #  end
   end

   context "unauthorized user" do
     before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end

     it "GET show returns http success" do
       get :show, topic_id: my_topic.id, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it "GET show posts comments" do
       get :show, id: my_post.id
       response_hash = JSON.parse response.body
       expect(response_hash['comments']).to_not be_nil
     end

     it "PUT update returns http unauthorized" do
       put :update, post: {title: "Post Name", body: "Post body goes here"}
       expect(response).to have_http_status(403)
     end

     it "POST create returns http unauthorized" do
       post :create, topic_id: my_topic.id, post: {title: "Post Name", body: "Post body goes here"}
       expect(response).to have_http_status(403)
     end

    #  it "DELETE destroy returns http unauthorized" do
    #    delete :destroy, topic_id: topic.id, id: post.id
    #    expect(response).to have_http_status(403)
    #  end
   end
 end
