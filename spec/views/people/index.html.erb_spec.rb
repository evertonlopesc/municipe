require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        full_name: "Full Name",
        cpf: "Cpf",
        cns: "Cns",
        email: "Email",
        phone: "Phone",
        status: "Status",
        address: nil
      ),
      Person.create!(
        full_name: "Full Name",
        cpf: "Cpf",
        cns: "Cns",
        email: "Email",
        phone: "Phone",
        status: "Status",
        address: nil
      )
    ])
  end

  it "renders a list of people" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Full Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cns".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
