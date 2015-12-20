RSpec.feature "User edits an artist" do
  scenario "they see the page for the individual artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    @artist = Artist.create(name: "Bob Wayne", image_path: artist_image_path)

    visit artists_path
    click_on "#{@artist[:name]}"
    click_on "Edit"
    fill_in "artist_name", with: "Tay Tay"
    click_on "Update Artist"

    expect(page).to have_content "Tay Tay"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
