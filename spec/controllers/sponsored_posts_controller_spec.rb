require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
#  let(:sponsor) { Sponsoredpost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)}
let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:sponsoredpost) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }

  # describe "GET index" do
  #    it "returns http success" do
  #      get :index
  #      expect(response).to have_http_status(:success)
  #    end
  #
  #    it "assigns sponsor to @sponsoredposts" do
  #      get :index
  #      expect(assigns(:sponsoredposts)).to eq([sponsor])
  #    end
  #  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: sponsoredpost.id}
      expect(response).to render_template :show
    end

    it "assigns sponsor to @sponsoredposts" do
      get :show, topic_id: topic.id, id: sponsoredpost.id
      expect(assigns(:sponsoredpost)).to eq(sponsoredpost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new,  topic_id: topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsoredpost" do
      get :new, topic_id: topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of sponsoredpost by 1" do
      expect{post :create, topic_id: topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new post to @sponsoredpost" do
      post :create, topic_id: topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsoredpost" do
      post :create, topic_id: topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}
      expect(response).to redirect_to [topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id , id: sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: topic.id, id: sponsoredpost.id
      expect(response).to render_template :edit
    end

    it "assigns sponsoredpost to be updated to @sponsoredpost" do
      get :edit, topic_id: topic.id, id: sponsoredpost.id
      sponsor_instance = assigns(:sponsoredpost)

      expect(sponsor_instance.id).to eq sponsoredpost.id
      expect(sponsor_instance.title).to eq sponsoredpost.title
      expect(sponsor_instance.body).to eq sponsoredpost.body
      expect(sponsor_instance.price).to eq sponsoredpost.price
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_price

      put :update, topic_id: topic.id, id: sponsoredpost.id, sponsoredpost: {title: new_title, body: new_body, price: new_price}

      updated_post = assigns(:sponsoredpost)
      expect(updated_post.id).to eq sponsoredpost.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
      expect(updated_post.price).to eq new_price
    end

    it "redirects to the update post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_price

      put :update, topic_id: topic.id, id: sponsoredpost.id, sponsoredpost: {title: new_title, body: new_body, price: new_price}
      expect(response).to redirect_to [topic, sponsoredpost]
    end
  end

  describe "DELETE destroy" do
    it "deletes the ad" do
      delete :destroy, topic_id: topic.id, id: sponsoredpost.id

      count = SponsoredPost.where({id: sponsoredpost.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: topic.id, id: sponsoredpost.id
      expect(response).to redirect_to topic
    end
  end

end
