RSpec.feature "User edits a song" do
  scenario "they see a link to the artist's page" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    @artist = Artist.create(name: "Bob Wayne", image_path: artist_image_path)
    @song = @artist.songs.create(title: "No Woman No Cry")

    visit artist_path(@artist)
    click_on "#{@song.title}"
    click_on "Edit"
    fill_in "song[title]", with: "Washed Ashore"
    click_on "Update Song"

    expect(page).to have_content "Washed Ashore"
    expect(page).to have_link @artist.name, href: artist_path(@artist)
  end
end
