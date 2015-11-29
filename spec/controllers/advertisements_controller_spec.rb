require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let (:ad) { Advertisement.create!(title: "GET RiCH qUiCK!!!!", copy: "I maKE 10,000 $$$ a DAy at HOME!!! Its oS eAsY! iN thE tIMe It took to read tHIS i boUgHt a NEw CAR AnD SHOES!!1!", price: 49) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: ad.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "AD create" do
    it "increases the number of Advertisement by 1 " do
      expect{post :create, ad: {title: "New Ad", copy: "Buy me!", price: "15"}}.to change(Advertisement, :count).by(1)
    end
  end
end
