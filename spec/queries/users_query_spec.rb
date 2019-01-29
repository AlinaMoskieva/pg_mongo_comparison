require "rails_helper"

describe UsersQuery do
  describe "#all" do
    subject(:result) { described_class.new.all }

    let(:first_row) { result.first }
    let(:last_row) { result.last }

    before do
      create_list :user, 2, state: "Iowa"
      create_list :user, 1, state: "Georgia"
    end

    it "returns ordered collection of states with users amount" do
      expect(first_row.state).to eq("Georgia")
      expect(first_row.users_amount).to eq(1)

      expect(last_row.state).to eq("Iowa")
      expect(last_row.users_amount).to eq(2)
    end
  end
end
