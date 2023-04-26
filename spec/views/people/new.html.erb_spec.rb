require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, FactoryBot.create(:person))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

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