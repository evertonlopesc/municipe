require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  let(:person) { FactoryBot.create(:person) }

  before(:each) do
    assign(:person, person)
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(person), "post" do

      assert_select "input[name=?]", "person[full_name]"

      assert_select "input[name=?]", "person[cpf]"

      assert_select "input[name=?]", "person[cns]"

      assert_select "input[name=?]", "person[email]"

      assert_select "input[name=?]", "person[phone]"

      assert_select "input[name=?]", "person[status]"

      assert_select "input[name=?]", "person[address_id]"
    end
  end
end