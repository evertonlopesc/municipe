require "test_helper"

module County
  class RecordTest < ActiveSupport::TestCase
    def build_county(name:, id_ibge:, state:)
      ::County::Record.new(name: name, id_ibge: id_ibge, state: state,)
    end

    test "should return truth" do
      county = build_county(name: 'Fortaleza', id_ibge: 1100085, state: 'Ceará')

      assert county.valid?
    end

    test "should return status active by default" do
      county = build_county(name: 'Euzébio', id_ibge: 1100084, state: 'Ceará')

      assert_equal county.status, 'active'
    end

    test "should return true when id_ibge is equal seven" do
      county = build_county(name: 'Fortaleza', id_ibge: 1100085, state: 'Ceará')

      assert county.valid?
    end

    test "should not save county without name" do
      county = build_county(name: nil, id_ibge: 1100085, state: 'Ceará')

      assert_not county.valid?
    end

    test "should return false when id_ibge is greater than seven" do
      county = build_county(name: 'Acre', id_ibge: 11000011, state: 'Ceará')

      assert_not county.valid?
    end

    test "should return false when id_ibge is less than seven" do
      county = build_county(name: 'Fortaleza', id_ibge: 110085, state: 'Ceará')

      assert_not county.valid?
    end

    test "should not save county without id_ibge" do
      county = build_county(name: 'Euzébio', id_ibge: nil, state: 'Ceará')

      assert_not county.valid?
    end

    test "should not save county without state" do
      county = build_county(name: 'Euzébio', id_ibge: 1100084, state: nil)

      assert_not county.valid?
    end
  end
end