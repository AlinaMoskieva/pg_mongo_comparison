require "rails_helper"

describe UsersQuery do
  describe "#all" do
    subject(:result) { described_class.new.all }

    let(:iowa_row) { result.last }
    let(:georgia_row) { result.first }

    before do
      create_list :user, 2, state: "Iowa"
      create_list :user, 1, state: "Georgia"
    end

    it "returns ordered collection of states with users amount" do
      expect(result.last.state).to eq("Iowa")
      expect(result.last.users_amount).to eq(2)

      expect(result.first.state).to eq("Georgia")
      expect(result.first.users_amount).to eq(1)
    end
  end
end
