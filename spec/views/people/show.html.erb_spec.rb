require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    assign(:person, Person.create!(
      full_name: "Full Name",
      cpf: "Cpf",
      cns: "Cns",
      email: "Email",
      phone: "Phone",
      status: "Status",
      address: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Cns/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
