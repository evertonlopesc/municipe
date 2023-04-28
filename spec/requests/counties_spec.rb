require 'rails_helper'

RSpec.describe "/counties", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:county)
  }

  let(:invalid_attributes) { { name: nil, state: nil } }

  describe "GET /index" do
    it "renders a successful response" do
      County::Record.create! valid_attributes
      get counties_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      county = County::Record.create! valid_attributes
      get county_url(county)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_county_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      county = County::Record.create! valid_attributes
      get edit_county_url(county)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new county" do
        expect {
          post counties_url, params: { county: valid_attributes }
        }.to change(County::Record, :count).by(1)
      end

      it "redirects to the created county" do
        post counties_url, params: { county: valid_attributes }
        expect(response).to redirect_to(county_url(County::Record.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new county" do
        expect {
          post counties_url, params: { county: invalid_attributes }
        }.to change(County::Record, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post counties_url, params: { county: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Name updated" }
      }

      it "updates the requested county" do
        county = County::Record.create! valid_attributes
        patch county_url(county), params: { county: new_attributes }
        county.reload
        expect(county.name).to eq("Name updated")
      end

      it "redirects to the county" do
        county = County::Record.create! valid_attributes
        patch county_url(county), params: { county: new_attributes }
        county.reload
        expect(response).to redirect_to(county_url(county))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        county = County::Record.create! valid_attributes
        patch county_url(county), params: { county: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested county" do
      county = County::Record.create! valid_attributes
      expect {
        delete county_url(county)
      }.to change(County::Record, :count).by(-1)
    end

    it "redirects to the people list" do
      county = County::Record.create! valid_attributes
      delete county_url(county)
      expect(response).to redirect_to(counties_url)
    end
  end
end