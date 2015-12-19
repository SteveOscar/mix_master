require 'rails_helper'


RSpec.feature "User creates a song" do
  scenario "they see  the page for an individual song" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    # artist = Artist.create(name: "Bob Wayne", image_path: artist_image_path)
    artist = create(:artist)
    song_title = "Zebra"

    visit artist_path(artist)
    click_on "New Song"

    fill_in "song[title]", with: song_title
    click_on "Create Song"
    save_and_open_page
    expect(page).to have_content "Zebra"
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end


# As a user
# Given that artists exist in the database
# When I visit the artist songs index
# And I click "New song"
# And I fill in the title
# And I click "Create Song"
# Then I should see the song name
# And I should see a link to the song artist's individual page
