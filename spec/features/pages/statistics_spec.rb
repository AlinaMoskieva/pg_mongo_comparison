require "rails_helper"

feature "Statistics page" do
  let(:statistic_rows) { all("tr.statistic-row") }

  let(:first_row) { statistic_rows[0] }
  let(:last_row) { statistic_rows[1] }

  before do
    create_list :user, 2, state: "Wilanow"
    create :user, state: "Mokotow"

    create_list :person, 2, state: "Wilanow"
    create :person, state: "Mokotow"
  end

  scenario "a user sees state statistics" do
    visit root_path

    click_on "SQL"

    expect(first_row).to have_content("Mokotow")
    expect(first_row).to have_content("1")

    expect(last_row).to have_content("Wilanow")
    expect(last_row).to have_content("2")

    click_on "Materialized View"

    expect(first_row).to have_content("Mokotow")
    expect(first_row).to have_content("1")

    expect(last_row).to have_content("Wilanow")
    expect(last_row).to have_content("2")

    click_on "Mongo"

    expect(first_row).to have_content("Mokotow")
    expect(first_row).to have_content("1")

    expect(last_row).to have_content("Wilanow")
    expect(last_row).to have_content("2")
  end
end
