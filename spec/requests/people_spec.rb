require 'rails_helper'

RSpec.describe "/people", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(
      :person, address_id: FactoryBot.create(:address).id
    )
  }

  let(:invalid_attributes) { { cpf: nil, cns: nil } }

  describe "GET /show" do
    it "renders a successful response" do
      person = Person::Record.create! valid_attributes
      get person_url(person)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_person_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      person = Person::Record.create! valid_attributes
      get edit_person_url(person)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Person" do
        expect {
          post people_url, params: { person: valid_attributes }
        }.to change(Person::Record, :count).by(1)
      end

      it "redirects to the created person" do
        post people_url, params: { person: valid_attributes }
        expect(response).to redirect_to(person_url(Person::Record.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Person" do
        expect {
          post people_url, params: { person: invalid_attributes }
        }.to change(Person::Record, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post people_url, params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { full_name: "Name updated" }
      }

      it "updates the requested person" do
        person = Person::Record.create! valid_attributes
        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(person.full_name).to eq("Name updated")
      end

      it "redirects to the person" do
        person = Person::Record.create! valid_attributes
        patch person_url(person), params: { person: new_attributes }
        person.reload
        expect(response).to redirect_to(person_url(person))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        person = Person::Record.create! valid_attributes
        patch person_url(person), params: { person: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end