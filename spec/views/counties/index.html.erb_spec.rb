require 'rails_helper'

RSpec.describe "counties/index", type: :view do
  before(:each) do
    assign(:people, [
      FactoryBot.create(:county),
      FactoryBot.create(:county)
    ])
  end

  it "renders a list of people" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Id_IBGE".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
  end
end