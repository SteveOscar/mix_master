require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "they see  the page for an individual song" do
    artist = create(:artist)
    song_title = "Zebra"

    visit artist_path(artist)
    click_on "New Song"

    fill_in "song[title]", with: song_title
    click_on "Create Song"

    expect(page).to have_content "Zebra"
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
      artist = create(:artist)

      visit artist_path(artist)

      click_on "New Song"
      click_on "Create Song"
      expect(page).to have_content "Title can't be blank"
    end
  end
end
