require 'rails_helper'

RSpec.feature "User edits a playlists" do
  scenario "they see the page for the edited playlist" do
    playlists = create_list(:playlist_with_songs, 2)
    visit playlist_path(Playlist.all.first)
    click_on "Edit Playlist"

    expect(page).to have_content("Playlist 3")

    fill_in "playlist_name", with: "Grid Day"
    check("song-#{Song.all[3][:id]}")
    uncheck("song-#{Song.all.first[:id]}")
    click_on "Update Playlist"

    expect(page).to have_content("Grid Day")
    expect(page).should_not have_content("Playlist 3")
  end
end

#
# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song
