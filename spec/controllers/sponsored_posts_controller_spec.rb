require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do
#  let(:sponsor) { Sponsoredpost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price)}
let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:sponsoredpost) { topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }

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
      get :show, {id: sponsoredpost.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: sponsoredpost.id}
      expect(response).to render_template :show
    end

    it "assigns sponsor to @sponsoredposts" do
      get :show, {id: sponsoredpost.id}
      expect(assigns(:sponsoredpost)).to eq(sponsoredpost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @sponsoredpost" do
      get :new, topic_id: topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do

    it "increases the number of sponsoredpost by 1" do
      expect{post :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}}.to change(Sponsoredpost,:count).by(1)
    end

    it "assigns the new post to @sponsoredpost" do
      post :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}
      expect(assigns(:sponsoredpost)).to eq Sponsoredpost.last
    end

    it "redirects to the new sponsoredpost" do
      post :create, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price}
      expect(response).to redirect_to Sponsoredpost.last
    end
  end
end
