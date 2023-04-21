require 'rails_helper'

RSpec.describe Address::Record, type: :model do
  describe "instances" do
    subject(:address) { FactoryBot.build(:address) }

    context 'when build a county' do
      it 'return valid' do
        expect(address).to be_valid
      end

      it 'return active status' do
        address = Address::Record.new
        expect(address.active?).to be true
      end

      context 'associations' do
        it { should belong_to(:county) }
      end
    end
  end

  describe "validations" do
    subject(:address) { FactoryBot.build(:address) }

    context 'when require presence' do
      it { should validate_presence_of(:cep) }
      it { should validate_presence_of(:complement) }
      it { should validate_presence_of(:neighborhood) }
      it { should validate_presence_of(:number) }
      it { should validate_presence_of(:street) }
    end

    context "when require length" do
      it { should validate_length_of(:cep).is_equal_to(8) }
    end
  end
end