require 'rails_helper'

RSpec.describe County::Record, type: :model do
  describe "instances" do
    subject(:county) { FactoryBot.build(:county) }

    context "when build a county" do
      it "return valid" do
        expect(county).to be_valid
      end

      it "return active status" do
        expect(county.active?).to be true
      end
    end
  end

  describe "validations" do
    subject(:county) { FactoryBot.build(:county) }

    context "when require presence" do
      it { should validate_presence_of(:id_ibge) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:state) }
    end

    context "when require numericality" do
      it { should validate_numericality_of(:id_ibge) }
    end

    context "when require length" do
      it { should validate_length_of(:id_ibge).is_equal_to(7) }
    end
  end
end