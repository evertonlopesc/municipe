require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    address = FactoryBot.create(:address)
    assign(:people, [
      FactoryBot.create(:person, address_id: address.id),
      FactoryBot.create(:person, address_id: address.id)
    ])
  end

  it "renders a list of people" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Full name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cns".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
  end
end