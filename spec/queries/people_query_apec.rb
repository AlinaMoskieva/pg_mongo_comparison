require "rails_helper"

describe PeopleQuery do
  let(:first_row) { result.first }
  let(:last_row) { result.last }

  before do
    create_list :person, 2, state: "Iowa"
    create_list :person, 1, state: "Georgia"
  end

  describe "#all" do
    subject(:result) { described_class.new.all }

    it "returns ordered collection of states with users amount" do
      expect(first_row["_id"]).to eq("Georgia")
      expect(first_row["value"]).to eq(1)

      expect(last_row["_id"]).to eq("Iowa")
      expect(last_row["value"]).to eq(2)
    end
  end

  describe "#all_by_map_reduce" do
    subject(:result) { described_class.new.all_by_map_reduce }

    it "returns ordered collection of states with users amount" do
      expect(first_row["_id"]).to eq("Georgia")
      expect(first_row["value"]).to eq(1.0)

      expect(last_row["_id"]).to eq("Iowa")
      expect(last_row["value"]).to eq(2.0)
    end
  end
end
