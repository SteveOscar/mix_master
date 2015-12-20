require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see the page for all the playlists" do
    playlists = create_list(:playlist_with_songs, 2)

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
