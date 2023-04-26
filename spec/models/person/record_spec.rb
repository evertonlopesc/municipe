require 'rails_helper'

RSpec.describe Person::Record, type: :model do
  subject(:person) { FactoryBot.build(:person) }

  describe 'instance' do
    context 'when build a person' do
      it 'return valid' do
        expect(person).to be_valid
      end
    end

    context 'associations' do
      it { should belong_to(:address).class_name("Address::Record") }
      it { should have_one(:county).class_name("County::Record").through(:address) }
    end
  end

  describe 'validations' do
    context 'when require presence' do
      it { should validate_presence_of(:birthday) }
      it { should validate_presence_of(:cpf) }
      it { should validate_presence_of(:cns) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:full_name) }
      it { should validate_presence_of(:phone) }
    end

    context 'when require length' do
      it { should validate_length_of(:cns) }
    end

    context 'when require numericality' do
      it { should validate_numericality_of(:cns) }
    end

    context 'when require CNS' do
      describe 'valid' do
        context 'when cns not start with 7, 8 or 9' do
          it 'dv equal 11' do
            person = FactoryBot.build(:person, cns: '220091697930007')

            expect(person).to be_valid
          end

          it 'dv equal 10' do
            person = FactoryBot.build(:person, cns: '164238232590018')

            expect(person).to be_valid
          end
        end

        context 'when cns start with 7, 8 or 9' do
          it 'return valid' do
            person = FactoryBot.build(:person, cns: '983771391050006')

            expect(person).to be_valid
          end
        end
      end

      describe 'invalid' do
        it 'return invalid (123456789012345)' do
          person = FactoryBot.build(:person, cns: '123456789012345')

          expect(person).to_not be_valid
        end

        it 'return invalid (111111111111111)' do
          person = FactoryBot.build(:person, cns: '111111111111111')

          expect(person).to_not be_valid
        end
      end
    end
  end
end