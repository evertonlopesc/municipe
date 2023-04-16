require 'rails_helper'

RSpec.describe County::Record, type: :model do
  describe "instances" do
    context "when build a county" do
      it "return valid" do
        county = FactoryBot.build(:county)

        expect(county).to be_valid
      end
    end
  end
end