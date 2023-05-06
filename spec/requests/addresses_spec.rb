require 'rails_helper'

RSpec.describe "/addresses", type: :request do
  let(:county) { FactoryBot.create(:county) }
  let(:valid_attributes) { FactoryBot.attributes_for(:address, county_id: county.id) }
  let(:invalid_attributes) { { street: nil } }

  describe "GET /show" do
    it "renders a successful response" do
      address = Address::Record.create! valid_attributes
      get address_url(address)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      address = FactoryBot.create(:address)
      get new_address_url(address.id)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      address = Address::Record.create! valid_attributes
      get edit_address_url(address)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new address" do
        expect {
          post addresses_url(), params: { address: valid_attributes }
        }.to change(Address::Record, :count).by(1)
      end

      it "redirects to the created address" do
        post addresses_url(), params: { address: valid_attributes }
        expect(response).to redirect_to(address_url(Address::Record.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address" do
        address = FactoryBot.create(:address)
        expect {
          post addresses_url(), params: { address: invalid_attributes }
        }.to change(Address::Record, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post addresses_url(), params: { address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { street: "Street updated" }
      }

      it "updates the requested address" do
        address = Address::Record.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload
        expect(address.street).to eq("Street updated")
      end

      it "redirects to the address" do
        address = Address::Record.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload
        expect(response).to redirect_to(address_url(address))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        address = Address::Record.create! valid_attributes
        patch address_url(address), params: { address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end